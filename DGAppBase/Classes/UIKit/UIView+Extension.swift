//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//

import UIKit

extension UIView {
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            frame.origin.y = newValue
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            frame.size.height = newValue
        }
    }
    
    public var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            center.x = newValue
        }
    }
    
    public var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            center.y = newValue
        }
    }
    
    public var maxX: CGFloat {
        return frame.maxX
    }
    
    public var maxY: CGFloat {
        return frame.maxY
    }
    
    public var midX: CGFloat {
        return frame.midX
    }
    
    public var midY: CGFloat {
        return frame.midY
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            frame.size = newValue
        }
    }
    
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set(newValue) {
            frame.origin = newValue
        }
    }
    
    public var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            frame.origin.x = newValue
        }
    }
    
    public var top: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            frame.origin.y = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set(newValue) {
            frame.origin.x = newValue - frame.size.width
        }
    }
    
    public var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set(newValue) {
            frame.origin.y = newValue - frame.size.height
        }
    }
    
    /// 渐变色
    public func addGradientColor(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.addSublayer(gradientLayer)
    }
    
    /// 删除所有的子视图
    public func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
}
