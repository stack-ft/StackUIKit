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

    var body: some View {
        ZStack {
            config.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: isExpanded ? .infinity : config.initialWidth, maxHeight: isExpanded ? .infinity : config.initialHeight)
                .clipped()
                .cornerRadius(config.cornerRadius)
                .onTapGesture {
                    withAnimation {
                        isExpanded = true
                    }
                }
                .overlay (
                    VStack(alignment: .trailing) {
                        HStack {
                            Spacer()
                            if isExpanded {
                                closeButton()
                                    .opacity(0.6)
                                
                            }
                        }
                        Spacer()
                    }.padding(5)
                )
        }
    }
    
    @ViewBuilder
    private func closeButton() -> some View {
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
}
