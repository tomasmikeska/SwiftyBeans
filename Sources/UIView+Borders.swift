//
//  UIView+Borders.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

class Border: UIView {
    
    fileprivate var thickness: CGFloat = 1.0
    
    convenience init(color: UIColor?, thickness: CGFloat) {
        self.init(frame: .zero)
        self.thickness = thickness
        self.backgroundColor = color
    }
    
    func setup() {}
    
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
        visualConstraint("H:|-(0)-[view(==thickness)]")
        visualConstraint("V:|-(0)-[view]-(0)-|")
    }
}

class LeftBorder: Border {
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        visualConstraint("V:[view(==thickness)]-(0)-|")
        visualConstraint("H:|-(0)-[view]-(0)-|")
    }
}

extension UIView {
    
    @discardableResult
    func addBorders(edges: UIRectEdge, color: UIColor = .gray, thickness: CGFloat = 1.0) -> Self {
        var border: Border?
        if edges.contains(.top) || edges.contains(.all) {
            border = TopBorder(color: color, thickness: thickness)
        }
        if edges.contains(.left) || edges.contains(.all) {
            border = LeftBorder(color: color, thickness: thickness)
        }
        if edges.contains(.right) || edges.contains(.all) {
            border = RightBorder(color: color, thickness: thickness)
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            border = BottomBorder(color: color, thickness: thickness)
        }
        if let border = border {
            addSubview(border)
            border.setup()
        }
        return self
    }
}
