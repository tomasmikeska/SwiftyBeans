//
//  UIView+Borders.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

/**
 Abstract border view used by one-sided borders
 
 - note: Use only extended classes below
 */
class Border: UIView {
    
    fileprivate var thickness: CGFloat = 1.0
    
    convenience init(color: UIColor?, thickness: CGFloat) {
        self.init(frame: .zero)
        self.thickness = thickness
        self.backgroundColor = color
    }
    
    /**
     Override in child classes
    */
    func setup() {}
    
    /**
     Visual AutoLayout helper
    */
    fileprivate func visualConstraint(_ visual: String) {
        guard let superview = superview else { return }
        superview.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: visual,
            options: [],
            metrics: ["thickness": thickness],
            views: ["view": self]
        ))
    }
}

// MARK: - Borders

class TopBorder: Border {
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        visualConstraint("V:|-(0)-[view(==thickness)]")
        visualConstraint("H:|-(0)-[view]-(0)-|")
    }
}

class RightBorder: Border {
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        visualConstraint("H:[view(==thickness)]-(0)-|")
        visualConstraint("V:|-(0)-[view]-(0)-|")
    }
}

class BottomBorder: Border {
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        visualConstraint("V:[view(==thickness)]-(0)-|")
        visualConstraint("H:|-(0)-[view]-(0)-|")
    }
}

class LeftBorder: Border {
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        visualConstraint("H:|-(0)-[view(==thickness)]")
        visualConstraint("V:|-(0)-[view]-(0)-|")
    }
}

extension UIView {
    
    /**
     Add border to view
     
     - parameter edges: Specifies edges with borders
     - parameter color: Color of borders
     - parameter thickness: Thickness in CGFloat
     - returns: Self
     - note: adding new borders does *not* remove existing borders
    */
    @discardableResult
    func addBorders(edges: UIRectEdge, color: UIColor = .gray, thickness: CGFloat = 1.0) -> Self {
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(TopBorder(color: color, thickness: thickness))
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(LeftBorder(color: color, thickness: thickness))
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(RightBorder(color: color, thickness: thickness))
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(BottomBorder(color: color, thickness: thickness))
        }
        return self
    }
    
    // Helper function
    private func addBorder(_ border: Border) {
        addSubview(border)
        border.setup()
    }
}
