//
//  StackUI.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/1/23.
//

import SwiftUI

public enum StackUI {
    
//MARK: - Buttons
    public enum Buttons {
        
        public static func PrimaryButton(action: @escaping () -> Void, label: String = "Primary Button", config: ButtonConfiguation = ButtonConfiguation()) -> some View {
            Button1(action: action, label: label, config: config)
        }
        
        public static func SecondaryButton(action: @escaping () -> Void, label: String = "Secondary Button", config: ButtonConfiguation = ButtonConfiguation()) -> some View {
            Button2(action: action, label: label, config: config)
        }
        
        public static func RoundButton(action: @escaping () -> Void, config: ButtonConfiguation = ButtonConfiguation()) -> some View {
            Button3(action: action, config: config)
        }
        
        public static func ExpandableButton(actions: [() -> Void], config: ButtonConfiguation = ButtonConfiguation()) -> some View {
            Button4(actions: actions, config: config)
        }
        
        public static func LikeButton(action: @escaping () -> Void, config: ButtonConfiguation = ButtonConfiguation()) -> some View {
            Button5(action: action, config: config)
        }
    }
    
//MARK: - Cards
    public enum Cards {
        
        public static func BalanceCard(action: @escaping () -> Void, config: CardConfiguration = CardConfiguration(), type: CardType = .one) -> some View {
            switch type {
            case .one:
                return AnyView(Card1(config: config))
            case .two:
                return AnyView(BalanceCard2(config: config, action: action))
            }
        }
        
        public static func DebitCard(config: CardConfiguration = CardConfiguration(), type: CardType = .one) -> some View {
            switch type {
            case .one:
                return AnyView(DebitCard1(config: config))
            case .two:
                return AnyView(DebitCard2(config: config))
            }
        }
        
        public static func InformationCard(action: (() -> Void)? = nil, config: CardConfiguration = CardConfiguration()) -> some View {
            InformationCard1(config: config)
        }
        
    }
    
    //MARK: - TextFields
    public enum TextFields {
        public static func CurrencyTextField(amount: Binding<String>, config: TextFieldConfiguration = TextFieldConfiguration()) -> some View {
            TextField1(amount: amount, config: config)
        }
        
        public static func BasicTextField(text: Binding<String>, config: TextFieldConfiguration = TextFieldConfiguration()) -> some View {
            TextField2(text: text, config: config)
        }
        
        public static func SecureTextField(text: Binding<String>, config: TextFieldConfiguration = TextFieldConfiguration()) -> some View {
            TextField3(text: text, config: config)
        }
        
        public static func SearchTextField(text: Binding<String>, config: TextFieldConfiguration = TextFieldConfiguration()) -> some View {
            TextField4(config: config, text: text)
        }
        
        public static func ExpandingTextField(text: Binding<String>, config: TextFieldConfiguration = TextFieldConfiguration()) -> some View {
            TextField5(text: text, config: config)
        }
    }
    
    //MARK: - Images
    public enum Images {
        public static func ExpandingImageView(config: ImageViewConfigurations) -> some View {
            ExpandableImageView(config: config)
        }
    }
    
    //MARK: - Texts
    public enum Typography {
        public static func Text(text: String, style: TextStyle = .paragraph, font: FontConfigurations = FontConfigurations()) -> some View {
            Typography1(text: text, style: style, font: font)
        }
    }

    //MARK: - Utilities
    public enum Utilities {
        public static func StarRating(rating: Binding<Int>, maxRating: Int = 5, starSize: CGFloat = 30, onColor: Color = .yellow, offColor: Color = .gray) -> some View {
            StarRatingView(rating: rating, maxRating: maxRating, starSize: starSize, onColor: onColor, offColor: offColor)
        }
    }
}


let bundle = Bundle(for: StackUIClass.self)
class StackUIClass {}
