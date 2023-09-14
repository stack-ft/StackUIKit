//
//  TypographyView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/14/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct TypographyView: View {
    var body: some View {
        VStack(spacing: 10) {
            Group {
                StackUI.Typography.Text(text: "Hello world", style: .heading1)
                StackUI.Typography.Text(text: "Hello world", style: .heading2)
                StackUI.Typography.Text(text: "Hello world", style: .heading3)
                StackUI.Typography.Text(text: "Hello world", style: .body)
                StackUI.Typography.Text(text: "Hello world", style: .paragraph)
            }
            
            HStack {
                Text("With Custom Font")
                Spacer()
            }
            Group {
                StackUI.Typography.Text(text: "Hello world", style: .heading1, font: FontConfigurations(fontName: "Smoothing"))
                StackUI.Typography.Text(text: "Hello world", style: .heading2, font: FontConfigurations(fontName: "Smoothing"))
                StackUI.Typography.Text(text: "Hello world", style: .heading3, font: FontConfigurations(fontName: "Smoothing"))
                StackUI.Typography.Text(text: "Hello world", style: .body, font: FontConfigurations(fontName: "Smoothing"))
                StackUI.Typography.Text(text: "Hello world", style: .paragraph, font: FontConfigurations(fontName: "Smoothing"))
            }
            
        }.padding()
    }
}

struct TypographyView_Previews: PreviewProvider {
    static var previews: some View {
        TypographyView()
    }
}
