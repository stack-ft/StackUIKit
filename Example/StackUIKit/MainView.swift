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
            VStack(spacing: 10) {
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
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
