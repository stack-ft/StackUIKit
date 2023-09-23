//
//  StackUI+Configurations.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/4/23.
//

import Foundation
import SwiftUI

// MARK: - Cards Configuration

public struct CardConfiguration {
    let cardBrand: CardBrand
    let cornerRadius: CGFloat
    let textColor: String
    let primaryColor: String
    let brandName: String
    let amount: String
    let cardOverlayImg: String
    let currency: String
    let font: FontConfigurations
    let cardData: CardData?
    let informationTitle: String
    let informationBody: String
    
    public init(textColor: String = "FCFCFC",
                primaryColor: String = "194BFB",
                cardBrand: CardBrand = .none,
                cornerRadius: CGFloat = 20.0,
                brandName: String = "Your Brand",
                amount: String = "$500.00",
                cardOverlayImg: String = "cardMask",
                currency: String = "USD",
                font: FontConfigurations = FontConfigurations(),
                cardData: CardData? = nil,
                informationTitle: String = "Information Title",
                informationBody: String = "Change this by customizing the CardConfiguration paramater") {
        self.primaryColor = primaryColor
        self.textColor = textColor
        self.cardBrand = cardBrand
        self.cornerRadius = cornerRadius
        self.brandName = brandName
        self.amount = amount
        self.cardOverlayImg = cardOverlayImg
        self.currency = currency
        self.font = font
        self.cardData = cardData
        self.informationTitle = informationTitle
        self.informationBody = informationBody
    }
}

public struct CardData {
    let pan: String
    let expDate: String
    let cvv: String
    let cardHolder: String
    
    public init(pan: String,
                expDate: String,
                cvv: String,
                cardHolder: String) {
        self.pan = pan
        self.expDate = expDate
        self.cvv = cvv
        self.cardHolder = cardHolder
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
        case .masterCard:
            return "Mastercard"
        default:
            return ""
        }
    }
}

public enum CardType {
    case one
    case two
}

// MARK: - Buttons Configuration

public struct ButtonConfiguation {
    let textColor: String
    let primaryColor: String
    let width: ButtonWidth
    let size: ButtonSize
    let cornerRadius: CGFloat
    let disabled: Bool
    let isLiked: Bool
    let font: FontConfigurations
    let image: Image
    
    public init(textColor: String = "FCFCFC",
                primaryColor: String = "194BFB",
                width: ButtonWidth = .full,
                size: ButtonSize = .medium,
                cornerRadius: CGFloat = 17.0,
                disabled: Bool = false,
                isLiked: Bool = false,
                font: FontConfigurations = FontConfigurations(),
                image: Image = Image(stackIcon: .plus)) {
        self.textColor = textColor
        self.primaryColor = primaryColor
        self.width = width
        self.size = size
        self.cornerRadius = cornerRadius
        self.disabled = disabled
        self.isLiked = isLiked
        self.font = font
        self.image = image
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
    let searchableOptions: [String]
    let font: FontConfigurations
    
    public init(placeHolderText: String = "Enter Text",
                activeColor: String = "194BFB",
                currencySymbol: String = "$",
                placeHolderImage: String = "usa",
                cornerRadius: CGFloat = 17,
                validationType: TextFieldValidations = .none,
                searchableOptions: [String] = [],
                font: FontConfigurations = FontConfigurations()) {
        self.placeHolderText = placeHolderText
        self.activeColor = activeColor
        self.currencySymbol = currencySymbol
        self.placeHolderImage = placeHolderImage
        self.cornerRadius = cornerRadius
        self.validationType = validationType
        self.searchableOptions = searchableOptions
        self.font = font
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
    case mail_outline
    case map_pin_outline
    case menu
    case message_outline
    case message_fill
    case minus
    case dollar_send_fill
    case money_outline
    case paypal
    case phone_outline
    case plus
    case printer_outline
    case circular_question_mark_outline
    case receipt_tax_outline
    case receipt_tax_fill
    case receipt_outline
    case search_outline
    case search_fill
    case settings_outline
    case share_type_two_outline
    case share_outline
    case shop_add_outline
    case one_star_outline
    case half_star_fill
    case half_star_outline
    case one_star_fill
    case stats_up_fill
    case timer_outline
    case user_outline
    case user_fill
    case users_outline
    case wallet_outline
    
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
        case .mail_outline:
            return "mail"
        case .map_pin_outline:
            return "map-pin"
        case .menu:
            return "menu"
        case .message_outline:
            return "message"
        case .message_fill:
            return "message-1"
        case .minus:
            return "minus"
        case .dollar_send_fill:
            return "dollar-send"
        case .money_outline:
            return "money"
        case .paypal:
            return "paypal"
        case .phone_outline:
            return "phone"
        case .plus:
            return "plus"
        case .printer_outline:
            return "printer"
        case .circular_question_mark_outline:
            return "question-circle"
        case .receipt_tax_outline:
            return "receipt-tax-1"
        case .receipt_tax_fill:
            return "receipt-tax"
        case .receipt_outline:
            return "receipt"
        case .search_outline:
            return "Search"
        case .search_fill:
            return "Search-1"
        case .settings_outline:
            return "settings"
        case .share_type_two_outline:
            return "share-two"
        case .share_outline:
            return "share"
        case .shop_add_outline:
            return "shop-add"
        case .one_star_outline:
            return "star-1"
        case .half_star_fill:
            return "star-half-1"
        case .half_star_outline:
            return "star-half"
        case .one_star_fill:
            return "star"
        case .stats_up_fill:
            return "stats-up"
        case .timer_outline:
            return "timer"
        case .user_outline:
            return "user-1"
        case .user_fill:
            return "user"
        case .users_outline:
            return "users"
        case .wallet_outline:
            return "wallet"
        }
    }
}


// MARK: - ImageView Configurations

public struct ImageViewConfigurations {
    let image: Image
    let initialHeight: CGFloat
    let initialWidth: CGFloat
    let cornerRadius: CGFloat
    
    public init(image: Image,
                initialHeight: CGFloat = 200,
                initialWidth: CGFloat = .infinity,
                cornerRadius: CGFloat = 20) {
        self.image = image
        self.initialHeight = initialHeight
        self.initialWidth = initialWidth
        self.cornerRadius = cornerRadius
    }
}


// MARK: - Fonts
public struct FontConfigurations {
    // Users can provide the font name
    let fontName: String?
    let textColor: Color?
    
    public init(fontName: String? = nil,
                textColor: String? = nil) {
        self.fontName = fontName
        self.textColor = (textColor != nil) ? Color(UIColor(hex: textColor ?? "")) : nil
    }
}

// MARK: - Typography
public enum TextStyle {
    case heading1
    case heading2
    case heading3
    case body
    case paragraph
    
    var fontWeight: Font.Weight {
        switch self {
        case .heading1:
            return .black
        case .heading2:
            return .bold
        case .heading3:
            return .medium
        case .body, .paragraph:
            return .regular
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .heading1:
            return 50
        case .heading2:
            return 40
        case .heading3:
            return 35
        case .body:
            return 18
        case .paragraph:
            return 15
        }
    }
    
    var textColor: Color {
        switch self {
        case .heading1, .heading2, .heading3, .body:
            return Color(UIColor(hex: "232B38"))
        case .paragraph:
            return Color(UIColor(hex: "718096"))
        }
    }
}

