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
    let cardOverlayImg: String
    
    public init(textColor: String = "FCFCFC",
                primaryColor: String = "194BFB",
                cardBrand: CardBrand = .none,
                cornerRadius: CGFloat = 20.0,
                brandName: String = "Your Brand",
                amount: String = "$500.00",
                cardOverlayImg: String = "cardMask") {
        self.primaryColor = primaryColor
        self.textColor = textColor
        self.cardBrand = cardBrand
        self.cornerRadius = cornerRadius
        self.brandName = brandName
        self.amount = amount
        self.cardOverlayImg = cardOverlayImg
    }
}

public enum CardBrand {
    case visa
    case masterCard
    case amex
    case discover
    case none
    
    var imageName: String {
        switch self {
        case .visa:
            return "visa"
        default:
            return ""
        }
    }
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
                cornerRadius: CGFloat = 17.0,
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

// MARK: - TextField Configuration

public struct TextFieldConfiguration {
    let placeHolderText: String
    let activeColor: String
    let currencySymbol: String
    let placeHolderImage: String
    let cornerRadius: CGFloat
    
    public init(placeHolderText: String = "Enter Text",
                activeColor: String = "194BFB",
                currencySymbol: String = "$",
                placeHolderImage: String = "usa",
                cornerRadius: CGFloat = 17) {
        self.placeHolderText = placeHolderText
        self.activeColor = activeColor
        self.currencySymbol = currencySymbol
        self.placeHolderImage = placeHolderImage
        self.cornerRadius = cornerRadius
    }
}
