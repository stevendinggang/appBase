//  FujiBaseVC.swift
//  FujiLifeStyle
//
//  Created by steven on 2023/6/3.

import UIKit

extension UITableView {
    
    // MARK: - Cell registration and reuse
    
    /// Register a cell from a Xib file
    ///
    /// - Parameter aClass: The UITableViewCell subclass to register
    func registerNibCell<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    /// Register a cell from pure code
    ///
    /// - Parameter aClass: The UITableViewCell subclass to register
    func registerCell<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forCellReuseIdentifier: name)
    }
    
    /// Dequeue a reusable cell
    ///
    /// - Parameter aClass: The class of the cell to dequeue
    /// - Returns: The dequeued cell
    func dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableCell(withIdentifier: name) as? T else {
            fatalError("\(name) is not registered")
        }
        return cell
    }
    
    // MARK: - HeaderFooter registration and reuse
    
    /// Register a HeaderFooter view from a Xib file
    ///
    /// - Parameter aClass: The UIView subclass to register
    func registerHeaderFooterNib<T: UIView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /// Register a HeaderFooter view from pure code
    ///
    /// - Parameter aClass: The UIView subclass to register
    func registerHeaderFooterClass<T: UIView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /// Dequeue a reusable HeaderFooter view
    ///
    /// - Parameter aClass: The class of the view to dequeue
    /// - Returns: The dequeued view
    func dequeueReusableHeaderFooter<T: UIView>(_ aClass: T.Type) -> T {
        let name = String(describing: aClass)
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("\(name) is not registered")
        }
        return view
    }
    
}

