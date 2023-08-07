
//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//

import UIKit

open class FujiBaseTabBarController: UITabBarController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemTitleTextAttributes()
    }
    
    /// 设置所有UITabBarItem的文字属性
    func setupItemTitleTextAttributes() {
        let normalColor = UIColor.BaseTabBarNormalTextColor
        let selectColor = UIColor.BaseTabBarSelectTextColor
        setTabBarColor(normalColor, selectColor, nil)
    }
    
    
    /// 初始化一个子控制器
    open func setupOneChildViewController(childVC: UIViewController, title: String, image: String, selectedImage: String) {
        childVC.tabBarItem.title = title
        if !image.isEmpty { // 图片名有具体值
            childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        let nav = FujiBaseNavigationController(rootViewController: childVC)
        addChild(nav)
    }
    
    
    // MARK: - 设置TabBar 文字颜色和背景色
    open func setTabBarColor(_ normalColor: UIColor, _ selectColor: UIColor, _ bgColor: UIColor?) {
        let tabBarItem = UITabBarItem.appearance()
        
        // 普通状态下的文字属性
        var normalAttrs = [NSAttributedString.Key: Any]()
        normalAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10)
        normalAttrs[NSAttributedString.Key.foregroundColor] = normalColor
        
        // 选中状态下的文字属性
        var selectedAttrs = [NSAttributedString.Key: Any]()
        selectedAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10)
        selectedAttrs[NSAttributedString.Key.foregroundColor] = selectColor
        
        tabBarItem.setTitleTextAttributes(normalAttrs, for: .normal)
        tabBarItem.setTitleTextAttributes(selectedAttrs, for: .selected)
        
        // iOS13适配，处理未选中颜色失效
        if #available(iOS 13.0, *) {
            UITabBar.appearance().unselectedItemTintColor = normalColor
        }
        
        // iOS15适配，处理tabBar背景和分割线透明，选中颜色失效
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            
            if let bgColor = bgColor {
                appearance.backgroundColor = bgColor // tabBar背景颜色
            }
            
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
}
