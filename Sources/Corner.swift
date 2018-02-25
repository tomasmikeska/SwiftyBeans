//
//  Corners.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 25/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

/**
 Corner enum used when adding corner radius
 */
public enum Corner {
    // Single
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    // Double
    case top
    case bottom
    case left
    case right
    
    // Maps Corner to CACornerMask
    func toCornerMask() -> CACornerMask {
        switch self {
        case .topLeft: return .layerMinXMinYCorner
        case .topRight: return .layerMaxXMinYCorner
        case .bottomLeft: return .layerMinXMaxYCorner
        case .bottomRight: return .layerMaxXMaxYCorner
        case .top: return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom: return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .left: return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right: return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
}
