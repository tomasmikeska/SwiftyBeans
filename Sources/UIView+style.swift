//
//  UIView+style.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

// --- UIView Extension

extension UIView {
    
    /**
     Style the view with multiple style rules
     
     - parameter styles: Style rules
     - returns: Self
     */
    @discardableResult
    public func style(_ styles: Style...) -> Self {
        Style.render(self, styles)
        return self
    }
}
