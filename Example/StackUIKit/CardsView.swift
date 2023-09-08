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
    var config: CardConfiguration {
        return CardConfiguration(primaryColor: "#0d0d0d", cardBrand: .visa)
    }
    var body: some View {
        ScrollView {
            VStack {
                StackUI.Cards.BalanceCard1(action: {
                    print("Tapped")
                }, config: config)
                .onTapGesture {
                    print("Tap Gesture")
                }
                .softShadow(color: "#0d0d0d")
                .padding(.bottom)
                
                StackUI.Cards.DebitCard(action: {
                    print("Tapped")
                })
                .onTapGesture {
                    print("Tap Gesture")
                }
                .padding(.bottom)
                
                StackUI.Cards.InformationCard()
                
                
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
