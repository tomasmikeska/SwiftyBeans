//
//  Style+render.swift
//  SwiftyBeans
//
//  Created by Tomáš Mikeska on 23/02/2018.
//  Copyright © 2018 Tomáš Mikeska. All rights reserved.
//

import UIKit

extension Style {
    
    static func render(_ view: UIView, _ style: Style) {
        switch style {
            
        case background(let color):
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
            
        case cornerRadius(let radius):
            view.layer.cornerRadius = radius
            view.layer.masksToBounds = true
            
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
            
        case invisible(let invisible):
            view.isHidden = invisible
            
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
            
        default: ()
        }
    }
    
    static func render(_ view: UIView, _ styles: [Style]) {
        for style in styles {
            Style.render(view, style)
        }
    }
}