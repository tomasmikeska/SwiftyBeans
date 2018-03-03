# SwiftyBeans

[![Language: Swift 4](https://img.shields.io/badge/language-swift%204-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 10+](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)
[![CocoaPods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org/pods/SteviaLayout)
[![License: MIT](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/s4cha/Stevia/blob/master/LICENSE)

SwiftyBeans is u μlibrary for declarative iOS view styling. Write reusable, readable
and concise styles.

## Usage
```swift
let paragraphStyle: Style = .bean(
    .textColor(.black),
    .font("Avenir-Light"),
    .fontSize(20),
    .multiline
)

let accentTextStyle: Style = .bean(
    .paragraphStyle,
    .textColor(.blue)
)

label.style(accentTextStyle, .textAlign(.justified))
```

## Documentation

All attributes used are in the Style enum.

#### Beans
Beans are the metaphor for style modules. Beans simply wraps any number of
styles or another beans as bean is technically also a style.

```swift
let module: Style = .bean(anotherBean, andAnotherBean, .backgroundColor(.red))
```

#### UIView Attributes

Background color
```swift
.backgroundColor(UIColor)
```

Background image
```swift
.backgroundImage(UIImage?)
```

Content mode
```swift
.contentMode(UIViewContentMode)
```

Clips to bounds
```swift
.clipsToBounds(Bool)
```

Scale
```swift
.scale(CGFloat)
// -- or
.scaleX(CGFloat)
// -- or
.scaleY(CGFloat)
```

Translate
```swift
// First argument is axis, second y axis
.translate(CGFloat, CGFloat)
// -- or
.translateX(CGFloat)
// -- or
.translateY(CGFloat)
```

Rotate
```swift
.rotate(CGFloat)
```

Alpha
```swift
.alpha(CGFloat)
```

Visibility
```swift
.visible
.invisible
```

Box shadow
```swift
.shadow(color: UIColor = .black,
        opacity: Float = 0.3,
        verticalOffset: CGFloat = 0,
        horizontalOffset: CGFloat = 0,
        offset: CGSize? = nil,
        radius: CGFloat = 8)
```

Border
```swift
.border(thick: CGFloat = 1.0, color: UIColor = .black)
```

One-sided border
```swift
.border(edges: UIRectEdge, thick: CGFloat = 1.0, color: UIColor = .black)

// -- Example usage

.border(edges: [.top, .bottom])
```

Corner radius
```swift
.cornerRadius(CGFloat)
```

Single corner radius
(**NOTE**: Works only on iOS 11.0+, fallbacks to setting radius on all corners)

```swift
.cornerRadius(corner: Corner, _ radius: CGFloat)
```

Linear gradient
```swift
.linearGradient(direction: GradientDirection = .toBottom,
                locations: [NSNumber]? = nil,
                _ colors: UIColor...)

// -- Example usage

.linearGradient(direction: .toRight, .blue, .white)
```

#### UIImageView Attributes

Image
```swift
.image(UIImage?)
```

#### UILabel Attributes

Text color
```swift
.textColor(UIColor)
```

UIFont
```swift
.font(UIFont)

// -- or

.fontName(String)
```

Font size
```swift
.fontSize(CGFloat)
```

Text align
```swift
.textAlign(NSTextAlignment)
```

Number of lines
```swift
// Sets UILabels numberOfLines to 0
.multiline

// -- or

.numberOfLines(Int)
```

🎉🎉

## Instalation
SwiftyBeans doesn't contain any external dependencies.

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
pod 'SwiftyBeans'
```

Then in the `Podfile` directory:

```bash
$ pod install
```

## License

SwiftyBeans is released under the MIT License. Please see the LICENSE file for details.
