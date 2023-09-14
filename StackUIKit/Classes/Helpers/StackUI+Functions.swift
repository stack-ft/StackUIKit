//
//  StackUI+Functions.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/12/23.
//

import Foundation
import SwiftUI

// MARK: - Image

func Image(named imageName: String) -> Image {
    // Try to get the image from the main bundle
    if let _ = UIImage(named: imageName) {
        return Image(imageName)
    }
    // If not found in the main bundle, get the image from the library's bundle
    return Image(imageName, bundle: bundle)
}

// MARK: - Font

func getFont(config: FontConfigurations, size: CGFloat) -> Font {
    if let fontName = config.fontName {
        return Font.custom(fontName, size: size)
    }
    // Default to system font if no custom font is provided
    return Font.system(size: size) // You can adjust the default size as needed
}


//public func ImageToggleStyle(onImage: String, offImage: String) -> some ToggleStyle {
//    return ImageToggleStyleWrapper(onImage: onImage, offImage: offImage)
//}
