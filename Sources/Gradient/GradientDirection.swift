//
//  GradientDirection.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 24/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

public enum GradientDirection {
    case toBottom
    case toRight
    case toBottomRight
    case toBottomLeft
    case points(from: (Int, Int), to: (Int, Int))
    
    func getPoints() -> (CGPoint, CGPoint) {
        switch self {
        case .toBottom:      return (CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1))
        case .toRight:       return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0))
        case .toBottomRight: return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
        case .toBottomLeft:  return (CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1))
        case .points(from: let start, to: let end):
            return (CGPoint(x: start.0, y: start.1), CGPoint(x: end.0, y: end.1))
        }
    }
}
