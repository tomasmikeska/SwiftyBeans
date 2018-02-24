//
//  Gradient.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 24/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

extension UIView {
    
    func addGradientLayer(colors: [UIColor], locations: [NSNumber]?, start: CGPoint, end: CGPoint) {
        let gradientView = GradientLayerView()
        addFirstSubview(gradientView)
        self.fill(with: gradientView)
        
        if let gradientLayer = gradientView.layer as? CAGradientLayer {
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.locations = locations
            gradientLayer.startPoint = start
            gradientLayer.endPoint = end
        }
    }
    
    private func addFirstSubview(_ view: UIView) {
        if !self.subviews.isEmpty {
            self.insertSubview(view, belowSubview: self.subviews[0])
        } else {
            self.addSubview(view)
        }
    }
    
    private func fill(with view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
