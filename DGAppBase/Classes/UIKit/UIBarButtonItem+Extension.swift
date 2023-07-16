//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//


import UIKit

extension UIBarButtonItem {
    
    /// 根据图片生成UIBarButtonItem
    static func imageItem(imageName: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        return customItem(title: "", titleColor: UIColor.white, imageName: imageName, target: target, action: action, contentHorizontalAlignment: .center)
    }
    
    /// 根据文字生成UIBarButtonItem
    static func textItem(title: String, titleColor: UIColor, target: AnyObject, action: Selector) -> UIBarButtonItem {
        return customItem(title: title, titleColor: titleColor, imageName: "", target: target, action: action, contentHorizontalAlignment: .center)
    }
    
    /// 返回按钮 带箭头的
    static func backItem(imageName: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        return customItem(title: "", titleColor: UIColor.white, imageName: imageName, target: target, action: action, contentHorizontalAlignment: .left, isBack: true)
    }
    
    /// 快速初始化一个UIBarButtonItem，内部是按钮
    static func customItem(title: String, titleColor: UIColor, imageName: String, target: AnyObject, action: Selector, contentHorizontalAlignment: UIControl.ContentHorizontalAlignment, isBack: Bool = false) -> UIBarButtonItem {
        let button = UIButton()
        
        if title.count > 0 {
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        
        if imageName.count > 0 {
            button.setImage(UIImage(named: imageName), for: .normal)
            button.setImage(UIImage(named: imageName), for: .highlighted)
        }
        
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .disabled)
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        if isBack {
            button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        } else {
            button.sizeToFit()
        }
        
        button.contentHorizontalAlignment = contentHorizontalAlignment
        
        return UIBarButtonItem(customView: button)
    }
}
