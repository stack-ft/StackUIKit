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
    
    var config2: CardConfiguration {
        return CardConfiguration(textColor: "1A202C", primaryColor: "FFFFFF", amount: "$56,476.00")
    }
    
    let cardData = CardData(pan: "3827 4637 3103 7389", expDate: "10/24", cvv: "123", cardHolder: "John Wick")
    var config3: CardConfiguration {
        return CardConfiguration(textColor: "FFFFFF", primaryColor: "FF1744", cardBrand: .masterCard, cardOverlayImg: "card-cover", cardData: cardData)
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                StackUI.Cards.BalanceCard(action: {
                    print("Tapped")
                }, config: config)
                .onTapGesture {
                    print("Tap Gesture")
                }
                .softShadow(color: "#0d0d0d")

                
                StackUI.Cards.InformationCard()
                
                StackUI.Cards.BalanceCard(action: {
                    print("Tapped")
                }, config: config2, type: .two)
                .onTapGesture {
                    print("Tap Gesture")
                }
                .softShadow(color: "5D6A83")
                
                StackUI.Cards.DebitCard(config: config3)
                .onTapGesture {
                    print("Tap Gesture")
                }
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
