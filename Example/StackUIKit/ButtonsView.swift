//
//  ButtonsView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/7/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct ButtonsView: View {
    @State var rotate: Bool = false
    var secondaryColor1: ButtonConfiguation {
        return ButtonConfiguation(textColor: "194BFB", primaryColor: "194BFB", width: .full)
    }
    
    var secondaryColor2: ButtonConfiguation {
        return ButtonConfiguation(textColor: "194BFB", primaryColor: "194BFB", width: .half)
    }
    
    var secondaryColor3: ButtonConfiguation {
        return ButtonConfiguation(textColor: "194BFB", primaryColor: "194BFB", width: .quarter)
    }
    
    var primary1: ButtonConfiguation {
        return ButtonConfiguation(width: .full)
    }
    
    var primary2: ButtonConfiguation {
        return ButtonConfiguation(width: .half)
    }
    
    var primary3: ButtonConfiguation {
        return ButtonConfiguation(width: .quarter, disabled: true)
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Primary buttons")
                    Spacer()
                }.padding(.vertical)
                
                StackUI.Buttons.PrimaryButton(action: {
                    print("Button tapped")
                }, label: "Quarter Size button", config: primary3)
                .padding(.bottom)
                
                StackUI.Buttons.PrimaryButton(action: {
                    print("Button tapped")
                }, label: "Half Size button", config: primary2)
                .padding(.bottom)
                
                StackUI.Buttons.PrimaryButton(action: {
                    print("Button tapped")
                    withAnimation {
                        rotate.toggle()
                    }
                }, label: "Full Size button", config: primary1)
                
                HStack {
                    Text("Secondary buttons")
                    Spacer()
                }.padding(.vertical)
                
                StackUI.Buttons.SecondaryButton(action: {
                    print("Button tapped")
                }, label: "Quarter Size button", config: secondaryColor3)
                .padding(.bottom)
                .wobble(isAnimating: $rotate)
                
                StackUI.Buttons.SecondaryButton(action: {
                    print("Button tapped")
                }, label: "Half Size button", config: secondaryColor2)
                .padding(.bottom)
                .wobble(isAnimating: $rotate)
                
                StackUI.Buttons.SecondaryButton(action: {
                    print("Button tapped")
                }, label: "Full Size button", config: secondaryColor1)
                .wobble(isAnimating: $rotate)
                
                
                HStack {
                    Text("Round Buttons")
                    Spacer()
                }.padding(.vertical)
                
                Group {
                    StackUI.Buttons.RoundButton(action: {
                        print("Tapped")
                    })
                    .softShadow()
                    .padding(.bottom)
                    
                    StackUI.Buttons.ExpandableButton(actions: [
                        { print("Action 1 triggered") },
                        { print("Action 2 triggered") },
                        { print("Action 3 triggered") },
                        { print("Action 4 triggered") },
                        { print("Action 5 triggered") }
                    ])
                    .padding(.bottom)
                    
                    StackUI.Buttons.LikeButton(action: {
                        
                    }, config: ButtonConfiguation(primaryColor: "DD3333"))
                    
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
