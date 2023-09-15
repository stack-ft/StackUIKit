//
//  Switches.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/12/23.
//

import SwiftUI


public struct ImageToggleStyle: ToggleStyle {
 
    var onImage: String
    var offImage: String
    
    public init(onImage: String, offImage: String) {
        self.onImage = onImage
        self.offImage = offImage
    }
    
   public func makeBody(configuration: Configuration) -> some View {
 
        HStack {
            configuration.label
 
            Spacer()
 
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? .black : Color(.systemGray5))
                .overlay (
                    Image(named: configuration.isOn ? onImage : offImage)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .rotationEffect(.degrees(configuration.isOn ? 0 : -360))
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
