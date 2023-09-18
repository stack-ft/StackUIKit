//
//  StackUI+Extensions.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/1/23.
//

import Foundation
import SwiftUI


public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        if hexValue.count != 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension String {
    var initials: String {
        return self.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first ?? Character(""))") + "\($1.first ?? Character(""))" }
    }
}

extension Image {
    public init(stackIcon: StackIcon) {
        self.init(stackIcon.imageName, bundle: bundle)
    }
}

public extension ToggleStyle where Self == ImageToggleStyle {
    static func image(onImage: String, offImage: String) -> ImageToggleStyle {
        return ImageToggleStyle(onImage: onImage, offImage: offImage)
    }
}
