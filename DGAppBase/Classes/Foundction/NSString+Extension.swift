//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//


import Foundation
import UIKit

extension NSString {
    
    /// 判空
    public var isEmpty: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
    
    /// 计算一串字符在给定宽度下的正常显示所需的高度
    func getStringHeight(withWidth width: CGFloat, font: CGFloat) -> CGFloat {
        let size = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
        return size.height
    }
    
    /// 计算一串字符在一行中的正常显示所需的宽度
    func getStringWidth(font: CGFloat) -> CGFloat {
        let size = self.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
        return size.width
    }
    
    /// 根据字符串获取对应的类对象
    ///
    /// - Parameter className: 类名字符串
    /// - Returns: 类对象
    class func classFromString(_ className: String) -> UIViewController! {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls: AnyClass = NSClassFromString(namespace + "." + className)!
        let vcClass = cls as! UIViewController.Type
        return vcClass.init()
    }
    
    class func getStringByKey(_ key: String) -> String {
        let s = NSLocalizedString(key, comment: "")
        return s
    }
    
}

