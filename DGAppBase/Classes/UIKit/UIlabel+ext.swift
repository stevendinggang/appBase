//
//  UIlabel+ext.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/4.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, textColor: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 14.0), textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    static func getLabel(Title: String? = nil, textColor: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 14.0), textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel.init()
        
        label.text = Title
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
    
}


