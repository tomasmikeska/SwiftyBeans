//
//  Style+render.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

extension Style {
    
    /**
     Render specified style
     */
    static func render(_ view: UIView, _ style: Style) {
        switch style {
            
        case backgroundColor(let color):
            view.backgroundColor = color
            
        case image(let image) where view is UIImageView:
            (view as! UIImageView).image = image
            
        case backgroundImage(let image):
            guard let image = image else { return }
            view.backgroundColor = UIColor(patternImage: image)
            
        case contentMode(let mode):
            view.contentMode = mode
            
        case textColor(let color) where view is UILabel:
            (view as! UILabel).textColor = color
            
        case fontName(let fontName) where view is UILabel:
            let label = view as! UILabel
            label.font = UIFont(name: fontName, size: label.font.pointSize)
            
        case font(let font) where view is UILabel:
            (view as! UILabel).font = font
            
        case fontSize(let size) where view is UILabel:
            let label = view as! UILabel
            label.font = label.font.withSize(size)
            
        case textAlign(let alignment) where view is UILabel:
            (view as! UILabel).textAlignment = alignment
            
        case multiline where view is UILabel:
            (view as! UILabel).numberOfLines = 0
            
        case numberOfLines(let lines) where view is UILabel:
            (view as! UILabel).numberOfLines = lines
            
        case clipsToBounds(let clips):
            view.clipsToBounds = clips
            
        case styleCornerRadiusAll(let radius):
            view.layer.cornerRadius = radius
            
        case .styleCornerRadius(corner: let corner, radius: let radius):
            view.layer.cornerRadius = radius
            if #available(iOS 11.0, *) {
                view.layer.maskedCorners = corner.toCornerMask()
            }
            
        case scale(let scale):
            view.transform = view.transform.scaledBy(x: scale, y: scale)
            
        case scaleX(let scaleX):
            view.transform = view.transform.scaledBy(x: scaleX, y: 1)
            
        case scaleY(let scaleY):
            view.transform = view.transform.scaledBy(x: 1, y: scaleY)
            
        case translate(let x, let y):
            view.transform = view.transform.translatedBy(x: x, y: y)
            
        case translateX(let x):
            view.transform = view.transform.translatedBy(x: x, y: 1)
            
        case translateY(let y):
            view.transform = view.transform.translatedBy(x: 1, y: y)
            
        case rotate(let rotation):
            view.transform = view.transform.rotated(by: rotation)
            
        case alpha(let alpha):
            view.alpha = alpha
            
        case visible:
            view.isHidden = false
            
        case invisible:
            view.isHidden = true
            
        case styleModule(let styles):
            Style.render(view, styles)
            
        case styleBorder(thick: let thick, color: let color):
            view.layer.borderWidth = thick
            view.layer.borderColor = color.cgColor
            
        case styleBorderOneSided(edges: let edges, thick: let thick, color: let color):
            view.addBorders(edges: edges, color: color, thickness: thick)
            
        case styleShadow(color: let color, opacity: let opacity, offset: let offset, radius: let radius):
            view.layer.shadowColor = color.cgColor
            view.layer.shadowOpacity = opacity
            view.layer.shadowOffset = offset
            view.layer.shadowRadius = radius
            
        case styleLinearGradient(colors: let colors, locations: let locations, start: let start, end: let end):
            view.addGradientLayer(colors: colors, locations: locations, start: start, end: end)
            
        default: ()
        }
    }
    
    /**
     Render multiple styles
    */
    static func render(_ view: UIView, _ styles: [Style]) {
        for style in styles {
            Style.render(view, style)
        }
    }
}
