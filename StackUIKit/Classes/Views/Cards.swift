//
//  Cards.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/2/23.
//

import SwiftUI

struct Card1: View {
    let config: CardConfiguration
    
    var body: some View {
        ZStack {
            Color.clear
            cardBackground(background: config.primaryColor, cornerRadius: 20)
                .overlay(
                    VStack(spacing: 5) {
                        HStack {
                            Spacer()
                            Text(config.brandName)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                        Spacer()
                        HStack {
                            Text("Balance")
                                .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.7)))
                                .font(.system(size: 16, weight: .regular))
                            Spacer()
                        }
                        
                        HStack {
                            Text(config.amount)
                                .foregroundColor(Color(UIColor(hex: config.textColor)))
                                .font(.system(size: 25, weight: .black))
                            Spacer()
                        }
                    }.padding(25)
                )
        }
    }
}

struct DebitCard1: View {
    let config: CardConfiguration
    var body: some View {
        ZStack {
            Color.clear
            cardBackground(background: config.primaryColor, cornerRadius: 20)
        }
    }
}

struct InformationCard1: View {
    let config: CardConfiguration
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.white)
                .frame(width: .infinity, height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: config.primaryColor)), lineWidth: 1)
                )
                .overlay(
                    HStack(spacing: 10) {
                        Circle()
                            .fill(Color(UIColor(hex: "F7FAFC")))
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Information Title")
                                .foregroundColor(Color(UIColor(hex: "1A202C")))
                                .font(.system(size: 16, weight: .medium))
                            Text("Multi-users access, accounting, and using our API")
                                .foregroundColor(Color(UIColor(hex: "718096")))
                                .font(.system(size: 13, weight: .regular))
                        }
                        
                        Spacer()
                    }.padding()
                )
        }
    }
}

@ViewBuilder
private func cardBackground(background: String, cornerRadius: CGFloat) -> some View {
    RoundedRectangle(cornerRadius: cornerRadius)
        .fill(Color(UIColor(hex: background)))
        .frame(width: .infinity, height: 230)
}
