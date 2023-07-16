//
//  FujiFrameTool.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//

import UIKit

// MARK: - 尺寸信息

/// 屏幕宽度
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕高度
let kScreenHeight = UIScreen.main.bounds.height

/// 黄金比例的宽
let DG_Width_0_618 = kScreenWidth * 0.618

let DGWidthRatio = (kScreenWidth / 375.0)
let DGHeightRatio = (kScreenHeight / 667.0)
func DGRatio(_ value:CGFloat) -> CGFloat {
    return kScreenWidth * (value / 375.0)
}

/// 状态栏高度。非刘海屏20，X是44，11是48，12之后是47
let kStatusBarHeight = STATUSBAR_HEIGHT()
let kTopSafeHeight = STATUSBAR_HEIGHT()
let kBottomSafeHeight = INDICATOR_HEIGHT()

/// 导航条高度
let kContentNavBarHeight = 44.0
let kNavHeight = (kStatusBarHeight + kContentNavBarHeight)
let kTabBarHeight = (49.0 + kBottomSafeHeight)

/// tableView Y
let kTableViewY = kNavHeight
/// tableView高度
let kTableViewHeight = kScreenHeight-kTableViewY-kBottomSafeHeight
/// tableViewFrame
let kTableViewFrame = CGRect(x: 0, y: kTableViewY, width: kScreenWidth, height: kTableViewHeight)


/// 状态栏高度。X是44，其他是20
func STATUSBAR_HEIGHT() ->CGFloat {
    if #available(iOS 13.0, *) {
        return getWindow()?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}

/// 底部指示条高度
func INDICATOR_HEIGHT() ->CGFloat {
    if #available(iOS 11.0, *) {
        return getWindow()?.safeAreaInsets.bottom ?? 0
    } else {
        return 0
    }
}

/// 获取当前设备window用于判断尺寸
func getWindow() -> UIWindow? {
    if #available(iOS 13.0, *) {
        let winScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return winScene?.windows.first
    } else {
        return UIApplication.shared.keyWindow
    }
}


// MARK: - 系统版本

/// DG 当前系统版本
let iOS_SYSTEM_VERSION = (UIDevice.current.systemVersion as NSString).doubleValue

/// DG 系统版本大于等于
func DG_iOS_Later(_ version:Double) -> Bool {
    return iOS_SYSTEM_VERSION >= version
}

/// iOS9 及更高版本
let iOS9_Later = (iOS_SYSTEM_VERSION >= 9.0)
/// iOS10 及更高版本
let iOS10_Later = (iOS_SYSTEM_VERSION >= 10.0)
/// iOS11 及更高版本
let iOS11_Later = (iOS_SYSTEM_VERSION >= 11.0)
/// iOS13 及更高版本
let iOS13_Later = (iOS_SYSTEM_VERSION >= 13.0)
/// iOS14 及更高版本
let iOS14_Later = (iOS_SYSTEM_VERSION >= 14.0)
/// iOS15 及更高版本
let iOS15_Later = (iOS_SYSTEM_VERSION >= 15.0)
/// iOS16 及更高版本
let iOS16_Later = (iOS_SYSTEM_VERSION >= 16.0)
