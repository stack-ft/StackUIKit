//
//  TextFields.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/4/23.
//

import SwiftUI
import UIKit

struct TextField1: View {
    @State private var amount: String = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.clear)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(UIColor(hex: "EDF2F7")), lineWidth: 1)
                )
                .overlay (
                    VStack(alignment: .leading) {
                        Text("Enter amount")
                            .foregroundColor(Color(UIColor(hex: "718096")))
                            .font(.system(size: 14, weight: .regular))
                            .padding(2)
                        Spacer()
                        HStack(spacing: 3) {
                            Text("$")
                                .font(.system(size: 35, weight: .bold))
                            CurrencyTextFieldWrapper(text: $amount)
                                .frame(maxHeight: 40)
                            .keyboardType(.decimalPad)
                            Spacer()
                        }
                        .padding(2)
                    }.padding()
                )
        }
    }
    
}


//WIP
struct DropdownMenuView: View {
    @State private var selectedValue = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    @State var showStoreDropDown: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                showStoreDropDown.toggle()
            }) {
                Text("Open Menu")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.clear)
                    .foregroundColor(Color(UIColor(hex: "194BFB")))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color( UIColor(hex: "194BFB")), lineWidth: 2)
                    )
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
        }.overlay (
            
            VStack {
                
                if showStoreDropDown {
                    
                    Spacer(minLength: 70)
                    
                    SampleDropDown(action: { data in
                        
                    })
                    
                }
                
            }, alignment: .topLeading
            
        )
    }
}

struct SampleDropDown: View {
    
  
    let action : (String?) -> Void
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 4){
            
            ForEach(0...3, id: \.self){ valueStore in
                
                Button(action: {
                    
                    
                    
                }) {
                    
                    HStack(alignment: .center, spacing: 8) {
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading){
                            Text("ANDROID" )
                                .font(.system(size: 18, weight: .medium))

                                .padding([.leading, .top], 4)
                            
                            Text("#jetpack")
                                .font(.system(size: 14, weight: .regular))
                                .padding([.leading, .bottom], 2)
                            
                        }
                        
                        
                    }.foregroundColor(Color(UIColor(hex: "718096")))
                    
                }.frame(width: .none, height: .none, alignment: .center)
                
                
                Divider().background(Color(UIColor(hex: "718096")))
                
            }
            
        }.padding(.all, 12)
        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
        
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
