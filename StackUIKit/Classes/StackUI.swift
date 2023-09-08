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
        
        public static func PrimaryButton(action: @escaping () -> Void, label: String = "Primary Button", config: ButtonConfiguation = defaultButtonConfig()) -> some View {
            Button1(action: action, label: label, config: config)
        }
        
        public static func SecondaryButton(action: @escaping () -> Void, label: String = "Secondary Button", config: ButtonConfiguation = defaultButtonConfig()) -> some View {
            Button2(action: action, label: label, config: config)
        }
        
        public static func RoundButton(action: @escaping () -> Void, config: ButtonConfiguation = defaultButtonConfig()) -> some View {
            Button3(action: action, config: config)
        }
        
        public static func ExpandableButton(actions: [() -> Void], config: ButtonConfiguation = defaultButtonConfig()) -> some View {
            Button4(actions: actions, config: config)
        }
    }
    
//MARK: - Cards
    public enum Cards {
        
        public static func BalanceCard1(action: @escaping () -> Void, config: CardConfiguration = defaultCardConfig()) -> some View {
            Card1(config: config)
        }
        
        public static func DebitCard(action: @escaping () -> Void, config: CardConfiguration = defaultCardConfig()) -> some View {
            DebitCard1(config: config)
        }
        
    }

}

//MARK: - Default Empty Configuration

public func defaultButtonConfig() -> ButtonConfiguation {
    return ButtonConfiguation()
}

public func defaultCardConfig() -> CardConfiguration {
    return CardConfiguration()
}
