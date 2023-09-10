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
    let validationType: TextFieldValidations
    
    public init(placeHolderText: String = "Enter Text",
                activeColor: String = "194BFB",
                currencySymbol: String = "$",
                placeHolderImage: String = "usa",
                cornerRadius: CGFloat = 17,
                validationType: TextFieldValidations = .none) {
        self.placeHolderText = placeHolderText
        self.activeColor = activeColor
        self.currencySymbol = currencySymbol
        self.placeHolderImage = placeHolderImage
        self.cornerRadius = cornerRadius
        self.validationType = validationType
    }
}

public enum TextFieldValidations {
    case email
    case strongPassword
    case none
    
    func isValid(string: String) -> Bool {
        switch self {
        case .email:
            let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
            return emailPredicate.evaluate(with: string)
        case .strongPassword:
            let passwordPattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
            return passwordPredicate.evaluate(with: string)
        case .none:
            return true
        }
    }
    
    var errorMessage: String {
        switch self {
        case .email:
            return "Please provide a valid email address"
        case .strongPassword:
            return "Passwords must contain at least one uppercase, one lowercase, one digit, one special character, and be at least 8 characters long"
        case .none:
            return ""
        }
    }
}


// MARK: - Icons

public enum StackIcon {
    case alert_outline
    case bell_outline
    case eye_hide_outline
    case eye_view_outline
    case archive_outline
    case arrow_narrow_down_outline
    case arrow_narrow_up_outline
    case arrow_narrow_left_outline
    case arrow_narrow_right_outline
    case bitcoin
    case bookmark_outline
    case bookmark_fill
    case briefcase_outline
    case building_outline
    case calendar_outline
    case debitCard_outline
    case debitCard_fill
    case debitCard_send_outline
    case debitCard_receive_outline
    case chart_outline
    case chart_fill
    case check
    case chevron_down
    case chevron_left
    case chevron_right
    case chevron_up
    case clipboard_outline
    case copy_outline
    case dollar_outline
    case dots_vertical_fill
    case driving_fill
    case element_plus_outline
    case empty_wallet_fill
    case file_download_outline
    case file_text_outline
    case flash_outline
    case filter_outline
    case globe_outline
    case heart_outline
    case heart_fill
    case group_outline
    case home_fill
    case home_outline
    case like_outline
    case lock_outline
    
    var imageName: String {
        switch self {
        case .alert_outline:
            return "alert"
        case .bell_outline:
            return "bell"
        case .eye_hide_outline:
            return "hide"
        case .eye_view_outline:
            return "view"
        case .archive_outline:
            return "archive"
        case .arrow_narrow_down_outline:
            return "arrow-narrow-down"
        case .arrow_narrow_up_outline:
            return "arrow-narrow-up"
        case .arrow_narrow_left_outline:
            return "arrow-narrow-left"
        case .arrow_narrow_right_outline:
            return "arrow-narrow-right"
        case .bitcoin:
            return "bitcoin"
        case .bookmark_outline:
            return "bookmark"
        case .bookmark_fill:
            return "bookmark2"
        case .briefcase_outline:
            return "briefcase"
        case .building_outline:
            return "building"
        case .calendar_outline:
            return "calendar"
        case .debitCard_outline:
            return "card"
        case .debitCard_fill:
            return "card1"
        case .debitCard_send_outline:
            return "card-send"
        case .debitCard_receive_outline:
            return "card-receive"
        case .chart_outline:
            return "Chart"
        case .chart_fill:
            return "Chart1"
        case .check:
            return "check"
        case .chevron_down:
            return "chevron-down"
        case .chevron_left:
            return "chevron-left"
        case .chevron_right:
            return "chevron-right"
        case .chevron_up:
            return "chevron-up"
        case .clipboard_outline:
            return "clipboard"
        case .copy_outline:
            return "copy"
        case .dollar_outline:
            return "dollar"
        case .dots_vertical_fill:
            return "dots-vertical"
        case .driving_fill:
            return "driving"
        case .element_plus_outline:
            return "element-plus"
        case .empty_wallet_fill:
            return "empty-wallet"
        case .file_download_outline:
            return "file-download"
        case .file_text_outline:
            return "file-text"
        case .flash_outline:
            return "flash"
        case .filter_outline:
            return "Filter"
        case .globe_outline:
            return "global"
        case .heart_outline:
            return "heart"
        case .heart_fill:
            return "heart-1"
        case .group_outline:
            return "group"
        case .home_fill:
            return "home-1"
        case .home_outline:
            return "home"
        case .like_outline:
            return "like"
        case .lock_outline:
            return "lock"
        }
    }
}
