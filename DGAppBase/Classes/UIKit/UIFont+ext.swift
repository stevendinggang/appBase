//
//  UIFont+ext.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/4.
//

import UIKit

extension UIFont {
    
    static func regularPingFang(ofSize size: CGFloat) -> UIFont {
        let font = UIFont.init(name: "PingFangSC-Regular", size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mediumPingFang(ofSize size: CGFloat) -> UIFont {
        let font = UIFont.init(name: "PingFangSC-Medium", size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func semiboldPingFang(ofSize size: CGFloat) -> UIFont {
        let font = UIFont.init(name: "PingFangSC-Semibold", size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    //为常规字体定义快捷方式
   static func regular(size: CGFloat) -> UIFont {
       return UIFont(name: "HelveticaNeue", size: size) ?? UIFont.systemFont(ofSize: size)
   }
   
   //为粗体字体定义快捷方式
   static func bold(size: CGFloat) -> UIFont {
       return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
   }
   
   //为斜体字体定义快捷方式
   static func italic(size: CGFloat) -> UIFont {
       return UIFont(name: "HelveticaNeue-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
   }
}

