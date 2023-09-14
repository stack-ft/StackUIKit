//
//  MainView.swift
//  StackUIKit_Example
//
//  Created by samuel Ailemen on 9/7/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import StackUIKit

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: {
                    ButtonsView()
                }, label: {
                    Text("Buttons")
                })
                
                NavigationLink(destination: {
                    CardsView()
                }, label: {
                    Text("Cards")
                })
                
                NavigationLink(destination: {
                    TextFieldView()
                }, label: {
                    Text("TextFields")
                })
                
                NavigationLink(destination: {
                    IconsView()
                }, label: {
                    Text("Icons")
                })
                
                NavigationLink(destination: {
                    ImageView()
                }, label: {
                    Text("Images")
                })
                
                
                NavigationLink(destination: {
                    UtilitiesView()
                }, label: {
                    Text("Utilities")
                })
                
                NavigationLink(destination: {
                    TypographyView()
                }, label: {
                    Text("Typography")
                })
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
