//
//  Style.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

// --- BASE CLASS

public enum Style {
    
    // MARK: - ATTRIBUTES
    
    /**
     Set UIViews background color
     */
    case background(UIColor)
    
    /**
     Set UIViews background image
     */
    case backgroundImage(UIImage?)
    
    /**
     Set UIImageViews image
     */
    case image(UIImage?)
    
    /**
     Set UIViews contentMode
     */
    case contentMode(UIViewContentMode)
    
    /**
     Set UILabels text color
     */
    case textColor(UIColor)
    
    /**
     Set UILabels font
     */
    case font(UIFont)
    
    /**
     Set UILabels font with name
     */
    case fontName(String)
    
    /**
     Set UILabels font size
     */
    case fontSize(CGFloat)
    
    /**
     Set UILabels text alignment
     */
    case textAlign(NSTextAlignment)
    
    /**
     Set UILabels numberOfLines to 0
     */
    case multiline
    
    /**
     Set UILabels numberOfLines
     */
    case numberOfLines(Int)
    
    /**
     Set UIViews clipsToBounds
     */
    case clipsToBounds(Bool)
    
    /**
     Set UIViews cornerRadius
     */
    case cornerRadius(CGFloat)
    
    /**
     Set UIViews transform scale
     */
    case scale(CGFloat)
    
    /**
     Set UIViews transform scaleX
     */
    case scaleX(CGFloat)
    
    /**
     Set UIViews transform scaleY
     */
    case scaleY(CGFloat)
    
    /**
     Set UIViews transform translate
     */
    case translate(CGFloat, CGFloat)
    
    /**
     Set UIViews transform translateX
     */
    case translateX(CGFloat)
    
    /**
     Set UIViews transform translateY
     */
    case translateY(CGFloat)
    
    /**
     Set UIViews transform rotation
     */
    case rotate(CGFloat)
    
    /**
     Set UIViews alpha
     */
    case alpha(CGFloat)
    
    /**
     Make UIView invisible
     */
    case invisible(Bool)
    
    // Dont use these straight
    
    case styleShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat)
    
    case styleBorder(thick: CGFloat, color: UIColor)
    
    case styleBorderOneSided(edges: UIRectEdge, thick: CGFloat, color: UIColor)
    
    indirect case styleModule([Style])
    
    // --- HELPERS
    
    /**
     Specify drop shadow
     
     - parameter color: Shadow color
     - parameter opacity: Shadow opacity
     - parameter verticalOffset: Shadow offset on vertical axis
     - parameter horizontalOffset: Shadow offset on horizontal axis
     - parameter offset: Shadow offset, overwrites vertical and horizontal offset
     - parameter radius: Shadow radius
     */
    public static func shadow(
        color: UIColor = .black,
        opacity: Float = 0.3,
        verticalOffset: CGFloat = 0,
        horizontalOffset: CGFloat = 0,
        offset: CGSize? = nil,
        radius: CGFloat = 8) -> Style {
        return .styleShadow(
            color: color,
            opacity: opacity,
            offset: CGSize(width: offset?.width ?? horizontalOffset, height: offset?.height ?? verticalOffset),
            radius: radius
        )
    }
    
    /**
     Set UIViews border
     
     - parameter edges: Specify edges
     - parameter thick: Border thickness
     - parameter color: Border color
     */
    public static func border(edges: UIRectEdge, thick: CGFloat = 1.0, color: UIColor = .black) -> Style {
        return .styleBorderOneSided(edges: edges, thick: thick, color: color)
    }
    
    /**
     Set UIViews border
     
     - parameter thick: Border thickness
     - parameter color: Border color
     */
    public static func border(thick: CGFloat = 1.0, color: UIColor = .black) -> Style {
        return .styleBorder(thick: thick, color: color)
    }
    
    public static func bean(_ styles: Style...) -> Style {
        return Style.styleModule(styles)
    }
}
