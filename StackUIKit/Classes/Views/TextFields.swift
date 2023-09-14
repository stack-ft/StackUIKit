//
//  TextFields.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/4/23.
//

import SwiftUI
import UIKit

struct TextField1: View {
    @Binding var amount: String
    let config: TextFieldConfiguration
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.clear)
                .frame(width: .infinity, height: 100)
                .overlay (
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: "EDF2F7")), lineWidth: 1)
                        .frame(width: .infinity, height: 100)
                )
                .overlay (
                    VStack(alignment: .leading) {
                        Text("Enter amount")
                            .foregroundColor(Color(UIColor(hex: "718096")))
                            .font(.system(size: 14, weight: .regular))
                            .padding(2)
                        Spacer()
                        HStack(spacing: 3) {
                            Text(config.currencySymbol)
                                .font(.system(size: 35, weight: .bold))
                            CurrencyTextFieldWrapper(text: $amount)
                                .frame(height: 40)
                                .keyboardType(.decimalPad)
                            Spacer()
                            Image(config.placeHolderImage, bundle: bundle)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                        }
                        .padding(2)
                    }.padding()
                )
        }
    }
    
}

struct TextField2: View {
    @Binding var text: String
    @State var isActive: Bool = false
    let config: TextFieldConfiguration
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.clear)
                .frame(height: 60)
                .overlay (
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: isActive ? strokeColor() : "EDF2F7")), lineWidth: 1)
                        .frame(height: 60)
                )
                .overlay (
                    TextField(config.placeHolderText, text: $text, onEditingChanged: { isEditing in
                        if isEditing {
                            isActive = true
                        } else {
                            if config.validationType.isValid(string: text) {
                                isActive = false
                            }
                        }
                    })
                    .font(.system(size: 17, weight: .regular))
                    .padding()
                )
            
            if !text.isEmpty && !config.validationType.isValid(string: text) {
                HStack(spacing: 5) {
                    Image("alert", bundle: bundle)
                        .foregroundColor(Color(UIColor(hex: "DD3333")))
                    
                    Text(config.validationType.errorMessage)
                        .foregroundColor(Color(UIColor(hex: "DD3333")))
                        .font(.system(size: 14, weight: .regular))
                }
            }
        }
    }
    
    private func strokeColor() -> String {
        if !text.isEmpty && !config.validationType.isValid(string: text) {
            return "DD3333"
        } else {
            return config.activeColor
        }
    }
}

struct TextField3: View {
    @Binding var text: String
    @State var isActive: Bool = false
    @State private var isPasswordVisible: Bool = false
    let config: TextFieldConfiguration
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.clear)
                .frame(height: 60)
                .overlay (
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: isActive ? strokeColor() : "EDF2F7")), lineWidth: 1)
                        .frame(height: 60)
                )
                .overlay (
                    HStack {
                        if isPasswordVisible {
                            TextField(config.placeHolderText, text: $text, onEditingChanged: { isEditing in
                                if isEditing {
                                    isActive = true
                                } else {
                                    if config.validationType.isValid(string: text) {
                                        isActive = false
                                    }
                                }
                            })
                            .font(.system(size: 17, weight: .regular))
                        } else {
                            SecureField(config.placeHolderText, text: $text, onCommit: {
                                if config.validationType.isValid(string: text) {
                                    isActive = false
                                }
                            })
                            .onTapGesture {
                                isActive = true
                            }
                            .font(.system(size: 17, weight: .regular))
                        }
                        
                        Button(action: toggleVisibility) {
                            Image(isPasswordVisible ? "hide" : "view", bundle: bundle)
                                .foregroundColor(Color(UIColor(hex: "A0AEC0")))
                        }
                        
                    }.padding()
                    
                )
            
            if !text.isEmpty && !config.validationType.isValid(string: text) {
                HStack(spacing: 5) {
                    Image("alert", bundle: bundle)
                        .foregroundColor(Color(UIColor(hex: "DD3333")))
                    
                    Text(config.validationType.errorMessage)
                        .foregroundColor(Color(UIColor(hex: "DD3333")))
                        .font(.system(size: 14, weight: .regular))
                }
            }
        }
    }
    
    private func toggleVisibility() {
        isPasswordVisible.toggle()
    }
    
    private func strokeColor() -> String {
        if !text.isEmpty && !config.validationType.isValid(string: text) {
            return "DD3333"
        } else {
            return config.activeColor
        }
    }
}

struct TextField4: View {
    @Binding var text: String
    @State var isActive: Bool = false
    let config: TextFieldConfiguration
    var options: [String]
    @State var filtered: [String] = []
    @State var temporaryString: String = ""
    
    public init(config: TextFieldConfiguration, text: Binding<String>) {
        self.config = config
        self.options = config.searchableOptions
        self._text = text
    }
    var body: some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.clear)
                .frame(height: 60)
                .overlay (
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: isActive ? config.activeColor : "EDF2F7")), lineWidth: 1)
                        .frame(height: 60)
                )
                .overlay (
                    TextField(config.placeHolderText, text: $text, onEditingChanged: { isEditing in
                        if isEditing {
                            withAnimation {
                                isActive = true
                            }
                        } else {
                            withAnimation {
                                isActive = false
                            }
                        }
                    })
                    .onChange(of: text) { newValue in
                        if !isActive && temporaryString != newValue {
                            isActive = true
                        }
                        DispatchQueue.main.async {
                            filtered = options.filter { $0.lowercased().contains(newValue.lowercased()) }
                        }
                    }
                        .font(.system(size: 17, weight: .regular))
                        .padding()
                )
            
            if isActive {
                searchResults()
                    .frame(maxHeight: 300)
            }
        }
    }
    
    @ViewBuilder
    private func searchResults() -> some View {
        ZStack {
            if filtered != [] {
                RoundedRectangle(cornerRadius: config.cornerRadius)
                    .stroke(Color(UIColor(hex: "EDF2F7")), lineWidth: 1)
                    .frame(width: .infinity)
                VStack {
                    ScrollView(showsIndicators: false) {
                    ForEach(filtered, id: \.self) { value in
                        Button(action: {
                            withAnimation {
                                text = value
                                temporaryString = value
                                isActive.toggle()
                            }
                        }) {
                            HStack {
                                Text(value)
                                    .padding()
                                    .foregroundColor(Color(UIColor(hex: "1A202C")))
                                Spacer()
                            }
                        }
                        .padding(.bottom, filtered.last == value ? 7 : 0)
                        .padding(.top, filtered.first == value ? 7 : 0)
                        divider(isLast: filtered.last == value)
                    }
                }
                }
            }
        }
        
    }
    
    @ViewBuilder
    private func divider(isLast: Bool) -> some View {
        if !isLast {
            Divider()
        }
    }
}


struct CurrencyTextFieldWrapper: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.delegate = context.coordinator
        textField.placeholder = "0.00"
        textField.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CurrencyTextFieldWrapper
        
        init(_ parent: CurrencyTextFieldWrapper) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string).filter { "0123456789".contains($0) } // Only keep numbers
            
            if let number = Double(updatedText) {
                let dollarAmount = number / 100.0
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.minimumFractionDigits = 2
                formatter.maximumFractionDigits = 2
                parent.text = formatter.string(from: NSNumber(value: dollarAmount)) ?? ""
            } else {
                parent.text = updatedText
            }
            
            textField.text = parent.text
            return false
        }
    }
    
}
