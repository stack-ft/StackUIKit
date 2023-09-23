//
//  ToggleSwitches.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/12/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct UtilitiesView: View {
    @State var isEnabled: Bool = false
    @State private var currentRating = 0
    @State private var showToast: Bool = false
    var body: some View {
        ZStack {
            
            isEnabled ? Color.black.opacity(0.9) : Color.white
            VStack(spacing: 10) {
                Toggle(isOn: $isEnabled) {
                    Text("Image Switch")
                        .foregroundColor(isEnabled ? .white : .black)
                }
                .toggleStyle(.image(onImage: "light", offImage: "dark"))
                .padding()
                
                StackUI.Utilities.StarRating(rating: $currentRating)
                
                Text("Current Rating: \(currentRating)")
                
            }
        }
        .stackUIToast(config: CardConfiguration(), showToast: $showToast)
        .onAppear {
            showToast = true
        }
    }
}

struct ToggleSwitches_Previews: PreviewProvider {
    static var previews: some View {
        UtilitiesView()
    }
}
