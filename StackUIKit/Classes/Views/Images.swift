//
//  Images.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/11/23.
//

import SwiftUI

struct ExpandableImageView: View {
    @State private var isExpanded: Bool = false
    let config: ImageViewConfigurations
    @State private var zIndex: Double = 0

    var body: some View {
        ZStack {
            if isExpanded {
                RoundedRectangle(cornerRadius: config.cornerRadius)
                    .fill(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }

                config.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(config.cornerRadius)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            } else {
                config.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: config.initialWidth, height: config.initialHeight)
                    .clipped()
                    .cornerRadius(config.cornerRadius)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
        }
    }
}
