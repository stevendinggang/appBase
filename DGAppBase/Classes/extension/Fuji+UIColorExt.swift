//  FujiUIColorExt.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/06/03.
//

import UIKit

extension UIColor {
    
    // 定义应用程序的颜色方案
    static let fujiRed = UIColor(hex: "ED1A3B") // 富士红颜色
    static let fujiGreen = UIColor(hex: "19906D") // logo绿色
    static let fujiGreen2 = UIColor(hex: "06B27C") // 绿色
    static let fujiGreen3 = UIColor(hex: "046E53") // 深绿色
    static let fujiBlack = UIColor(hex: "1A1A1A") // 主题背景黑色
    static let fujiGray = UIColor(hex: "A2A2A2") // 主题背景灰色
    static let fujiwhite = UIColor(hex: "FFFFFF") // 相框白色
    static let titleColor = UIColor(hex: "#010101") // 主要文字颜色
    static let subtitleColor = UIColor(hex: "7E7E7E") // 次要文字颜色

    static let BaseNavTitleColor = UIColor(hex: "1A1A1A") // 主题背景黑色
    static let BaseNavTextColor = UIColor(hex: "06B27C") // 主题背景黑色
    static let BaseTabBarNormalTextColor = UIColor(hex: "ED1A3B") // 次要文字颜色
    static let BaseTabBarSelectTextColor = UIColor(hex: "ED1A3B") // 次要文字颜色
    static let BaseNavBgColor = UIColor(hex: "F0F0F0") // 次要文字颜色
    static let BaseNavBgColor2 = UIColor(hex: "F0F0F0") // 次要文字颜色
    static let BaseNavTitleColor2 = UIColor(hex: "8B8B8B") // 次要文字颜色
    
    
    static let fujiPhotoBlack = UIColor(hex: "1C1B17") // 次要文字颜色
    static let primary = UIColor(hex: "123456") // 主题颜色
    static let secondary = UIColor(hex: "654321") // 次要颜色
    static let background = UIColor(hex: "F0F0F0") // 背景颜色
    static let buttonColor = UIColor(hex: "FF6347") // 按钮颜色
    // 根据需要添加更多颜色
    
    // 使用十六进制字符串初始化UIColor
    // - 参数:
    //   - hex: 十六进制字符串，可以是大写或小写，可以包含'#'也可以不包含
    //   - alpha: 颜色的透明度。默认值是1.0
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexFormatted = hexFormatted.replacingOccurrences(of: "#", with: "")
        assert(hexFormatted.count == 6, "使用了无效的十六进制代码.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    
    
    
}

