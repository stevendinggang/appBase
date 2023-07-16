
//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//

import UIKit

class FujiBaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        addFullScreenPanGesture()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Navigation Bar Setup
    
    /// 设置导航栏样式为半透明毛玻璃效果（白底黑字）
    func setupNavigationBar() {
        setNavigationBarColor(UIColor.BaseNavTitleColor, UIColor.BaseNavBgColor, false) // 主题色白字
        setNavigationBarColor(UIColor.BaseNavTitleColor2, UIColor.BaseNavBgColor2, false) // 白底黑字
    }
    
    // MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    // MARK: - Push View Controller
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            let backItem = UIBarButtonItem.backItem(imageName: "ic_dynamic_nav_back", target: self, action: #selector(handleBackButton))
            viewController.navigationItem.leftBarButtonItem = backItem
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func handleBackButton() {
        popViewController(animated: true)
    }
    
    // MARK: - Full Screen Pan Gesture
    
    func addFullScreenPanGesture() {
        // Extract the target object from the interactivePopGestureRecognizer
        guard
            let internalTargets = interactivePopGestureRecognizer?.value(forKey: "_targets") as? [NSObject],
            let firstTargetObject = internalTargets.first,
            let target = firstTargetObject.value(forKey: "target")
        else {
            print("Failed to get the internal target of the interactivePopGestureRecognizer.")
            return
        }

        // Define the action selector
        let action = Selector(("handleNavigationTransition:"))

        // Create a new pan gesture recognizer and set its target and action
        let panGesture = UIPanGestureRecognizer(target: target, action: action)

        // Add the new gesture recognizer to the view
        view.addGestureRecognizer(panGesture)
    }

}

// MARK: - Navigation Bar Color Setup

/// 设置导航栏为半透明毛玻璃效果（白底黑字）
func setHalfTransparentNavigationBar() {
    var titleTextAttributes = [NSAttributedString.Key: Any]()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = UIColor.black
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = titleTextAttributes
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

/// 设置导航栏为透明背景，白色标题
func setTransparentNavigationBar() {
    setNavigationBarColor(UIColor.white, UIColor.clear, true)
}

/// 设置导航栏背景颜色和标题颜色，是否透明
func setNavigationBarColor(_ titleColor: UIColor, _ barTintColor: UIColor, _ isTransparent: Bool) {
    var titleTextAttributes = [NSAttributedString.Key: Any]()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = titleColor
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    
    UINavigationBar.appearance().barTintColor = barTintColor
    
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = barTintColor
        appearance.titleTextAttributes = titleTextAttributes
        
        if isTransparent {
            appearance.backgroundColor = UIColor.clear
            appearance.backgroundEffect = nil
            appearance.shadowColor = nil
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
