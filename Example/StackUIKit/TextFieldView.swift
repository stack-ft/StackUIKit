//
//  TextFieldView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/7/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct TextFieldView: View {
    @State var amount: String = ""
    @State var text: String = ""
    @State var password: String = ""
    @State var searchText: String = ""
    @State var emailAddress: String = ""
    @State var strongPass:String = ""
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Currency TextField")
                    .font(.system(size: 15, weight: .medium))
                StackUI.TextFields.CurrencyTextField(amount: $amount, config: TextFieldConfiguration(cornerRadius: 20))
                
                Text("Basic TextField")
                    .font(.system(size: 15, weight: .medium))
                StackUI.TextFields.BasicTextField(text: $text)
                
                Text("Secure TextField")
                    .font(.system(size: 15, weight: .medium))
                StackUI.TextFields.SecureTextField(text: $password)
                
                Text("Search TextField")
                    .font(.system(size: 15, weight: .medium))
                StackUI.TextFields.SearchTextField(text: $searchText)
                
                Group {
                    Text("Basic TextField with email validation")
                        .font(.system(size: 15, weight: .medium))
                    StackUI.TextFields.BasicTextField(text: $emailAddress, config: TextFieldConfiguration(validationType: .email))
                    
                    Text("Secure TextField with strong pass validation")
                        .font(.system(size: 15, weight: .medium))
                    StackUI.TextFields.SecureTextField(text: $strongPass, config: TextFieldConfiguration(validationType: .strongPassword))
                }
                
            }.padding()
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
