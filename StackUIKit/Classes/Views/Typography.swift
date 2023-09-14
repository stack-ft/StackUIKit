//
//  Typography.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/13/23.
//

import SwiftUI

public struct Typography1: View {
    let text: String
    let style: TextStyle
    let font: FontConfigurations
    
    public init(text: String,
                style: TextStyle = .paragraph,
                font: FontConfigurations = FontConfigurations()) {
        self.text = text
        self.style = style
        self.font = font
    }
    public var body: some View {
        Text(text)
            .font(getFont(config: font, size: style.fontSize))
            .fontWeight(style.fontWeight)
            .foregroundColor(style.textColor)
    }
}
