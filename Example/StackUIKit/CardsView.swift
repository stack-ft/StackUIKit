//
//  CardsView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/7/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct CardsView: View {
    var body: some View {
        ScrollView {
            VStack {
                StackUI.Cards.BalanceCard1(action: {
                    print("Tapped")
                })
                .onTapGesture {
                    print("Tap Gesture")
                }
                .softShadow()
                .padding(.bottom)
                
                StackUI.Cards.DebitCard(action: {
                    print("Tapped")
                })
                .onTapGesture {
                    print("Tap Gesture")
                }
                .padding(.bottom)
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
