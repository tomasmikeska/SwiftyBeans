//
//  LayerView.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 24/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

class GradientLayerView: UIView {
    
    override public class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
}
