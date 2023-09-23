//
//  ToastView.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/18/23.
//

import SwiftUI

public struct ToastView: View {
    let message: String
    @Binding var showToast: Bool

    public init(message: String, showToast: Binding<Bool>) {
        self.message = message
        _showToast = showToast
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                if showToast {
                    Text(message)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .frame(width: geometry.size.width, alignment: .center)
                        .offset(y: 10) // Optional: Add a little offset from the top
                        .animation(.easeInOut)
                        .onAppear(perform: hideToast)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func hideToast() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showToast = false
            }
        }
    }
}


struct ToastViewModifier: ViewModifier {
    let config: CardConfiguration
    @Binding var showToast: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            
            if showToast {
                VStack {
                    InformationCard1(config: config)
                        .padding([.top, .horizontal])
                        .transition(.move(edge: .top))
                        .onTapGesture {
                            hideToast()
                        }
                    Spacer()
                }
                .onAppear(perform: hideToast)
            }
        }
    }
    
    func hideToast() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showToast = false
            }
        }
    }
}

extension View {
    public func stackUIToast(config: CardConfiguration, showToast: Binding<Bool>) -> some View {
        self.modifier(ToastViewModifier(config: config, showToast: showToast))
    }
}


