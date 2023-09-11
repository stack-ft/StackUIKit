//
//  ImageView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/11/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct ImageView: View {
    var body: some View {
        ZStack {
        ScrollView {
                VStack(spacing: 20) {
                    

                    StackUI.Images.ExpandingImageView(config: ImageViewConfigurations(image: Image("sample")))
                    StackUI.Images.ExpandingImageView(config: ImageViewConfigurations(image: Image("sample2")))
                    StackUI.Images.ExpandingImageView(config: ImageViewConfigurations(image: Image("sample3")))
                    
                }.padding()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
