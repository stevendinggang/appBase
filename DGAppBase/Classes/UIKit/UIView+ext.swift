//
//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.
//


import UIKit

extension UIView {
    
    public func addCorner(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
}
