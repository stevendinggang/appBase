//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//


import UIKit


// MARK: - 应用信息
let AppDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
let AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? ""
let AppBundleID = Bundle.main.bundleIdentifier ?? ""
let AppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
let AppBuildNumber = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
let APPLanguage = NSLocale.preferredLanguages.first ?? ""

let fApplication = UIApplication.shared

var fkeyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter { $0.isKeyWindow }.first
}

let fAppDelegate = UIApplication.shared.delegate
let fUserDefaults = UserDefaults.standard
let fNotificationCenter = NotificationCenter.default

// MARK: - 打印输出
public func Log<T>(_ message: T) {
    #if DEBUG
    print("\(message)")
    #endif
}

public func AllLog<T>(_ message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\n********** AllLog-satrt ***********\n\n文件名称:\(fileName)\n方法名称:\(funcName)\n行数:\(lineNum)\n信息:\n\n\(message)\n\n********** AllLog-end ***********\n")
    #endif
}
