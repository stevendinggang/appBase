
//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//

import UIKit

class FujiBaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemTitleTextAttributes()
        setupChildViewControllers()
    }
    
    /// 设置所有UITabBarItem的文字属性
    func setupItemTitleTextAttributes() {
        let normalColor = UIColor.BaseTabBarNormalTextColor
        let selectColor = UIColor.BaseTabBarSelectTextColor
        setTabBarColor(normalColor, selectColor, nil)
    }
    
    /// 添加所有子控制器
    func setupChildViewControllers() {
        
        setupOneChildViewController(childVC: FujiWaterMarkPageVC(), title: "水印", image: "4Normal", selectedImage: "4Normal")
        setupOneChildViewController(childVC: ViewController(), title: "首页", image: "icon_camera_Normal", selectedImage: "icon_camera_Normal")
        setupOneChildViewController(childVC: FujiHomePageVC(), title: "预设", image: "3465660_Normal", selectedImage: "3465660_Normal")
        setupOneChildViewController(childVC: MineViewController(), title: "我的", image: "icon_user_#9A_80px_Normal", selectedImage: "icon_user_#9A_80px_Normal")
    }
    
    /// 初始化一个子控制器
    fileprivate func setupOneChildViewController(childVC: UIViewController, title: String, image: String, selectedImage: String) {
        childVC.tabBarItem.title = title
        if !image.isEmpty { // 图片名有具体值
            childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        let nav = FujiBaseNavigationController(rootViewController: childVC)
        addChild(nav)
    }
    
    
    // MARK: - 设置TabBar 文字颜色和背景色
    func setTabBarColor(_ normalColor: UIColor, _ selectColor: UIColor, _ bgColor: UIColor?) {
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
