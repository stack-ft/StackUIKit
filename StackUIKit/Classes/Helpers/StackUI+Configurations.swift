//
//  StackUI+Configurations.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/4/23.
//

import Foundation

// MARK: - Cards Configuration

public struct CardConfiguration {
    let cardBrand: CardBrand
    let cornerRadius: CGFloat
    let textColor: String
    let primaryColor: String
    let brandName: String
    let amount: String
    
    public init(textColor: String = "FCFCFC",
         primaryColor: String = "194BFB",
         cardBrand: CardBrand = .visa,
         cornerRadius: CGFloat = 20.0,
         brandName: String = "Your Brand",
         amount: String = "$500.00") {
        self.primaryColor = primaryColor
        self.textColor = textColor
        self.cardBrand = cardBrand
        self.cornerRadius = cornerRadius
        self.brandName = brandName
        self.amount = amount
    }
}

public enum CardBrand {
    case visa
    case masterCard
    case amex
    case discover
    case none
}

// MARK: - Buttons Configuration

public struct ButtonConfiguation {
    let textColor: String
    let primaryColor: String
    let width: ButtonWidth
    let size: ButtonSize
    let cornerRadius: CGFloat
    let disabled: Bool

    public init(textColor: String = "FCFCFC",
         primaryColor: String = "194BFB",
         width: ButtonWidth = .full,
         size: ButtonSize = .medium,
         cornerRadius: CGFloat = 10.0,
         disabled: Bool = false) {
        self.textColor = textColor
        self.primaryColor = primaryColor
        self.width = width
        self.size = size
        self.cornerRadius = cornerRadius
        self.disabled = disabled
    }
}

public enum ButtonWidth {
    case full
    case half
    case quarter
}

public enum ButtonSize {
    case large
    case medium
    case small
}
