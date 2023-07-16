//
//  SwiftInfo.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/5.
//

import Foundation
import UIKit

// MARK: ---通用变量---
// Screen width and height
public let ScreenWidth = UIScreen.main.bounds.width    //屏幕的宽
public let ScreenHeight = UIScreen.main.bounds.height   //屏幕的高

// System version
public let SystemVersion = (UIDevice.current.systemVersion as NSString).floatValue

// Page size
public let CommonPageSize:Int = 20


// MARK: ---通用函数---

// Return a CGRect object
public func CGRectMake(_ x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) -> CGRect{
    return CGRect(x:x, y:y, width:width, height: height)
}

// Return a CGSize object
public func CGSizeMake(_ width: CGFloat, _ height: CGFloat) -> CGSize{
    return CGSize(width: width, height:height)
}

// Get String from dictionary
public func getStringFromNSDict(theKey key:String,andDict dict:NSDictionary) -> String {
    return (dict.value(forKey: key) as? String ) ?? ""
}

// Get NSDictionary from dictionary
public func getNSDictFromNSDict(theKey key:String,andDict dict:NSDictionary) -> NSDictionary {
    return (dict.value(forKey: key) as? NSDictionary) ?? NSDictionary.init()
}

// Get Int from dictionary
public func getIntFromNSDict(theKey key:String,andDict dict:NSDictionary) -> Int {
    return (dict.value(forKey: key) as? Int ) ?? 0
}

// Get Array from dictionary
public func getArrayFromNSDict(theKey key:String, andDict dict:NSDictionary) -> Array<Any> {
    return dict.value(forKey: key) as? Array<Any> ?? [Any]()
}

// Get string by key from LocalizedUtil
public func getStringWithKey(_ key:String) -> String {
    return NSString.getStringByKey(key)
}



// Get Localizable string by key from LocalizedUtil
public func LocalizableStringWith(_ key:String) -> String {
    return NSString.getStringByKey(key)
}

// Get "info" from JSON
public func getInfoFromJson(_ json:NSDictionary) -> NSDictionary {
    return getNSDictFromNSDict(theKey: "info", andDict: json)
}

// Get "data" from JSON
public func getDataFromJson(_ json:NSDictionary) -> Array<NSDictionary> {
    let info = getInfoFromJson(json)
    let dataArray = getArrayFromNSDict(theKey: "data", andDict: info)
    return dataArray as? Array<NSDictionary> ?? [NSDictionary]()
}
