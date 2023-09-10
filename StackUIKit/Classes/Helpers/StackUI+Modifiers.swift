//
//  StackUI+Modifiers.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/2/23.
//

import SwiftUI


struct Pulsing: ViewModifier {
    @Binding var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            .opacity(isAnimating ? 0.6 : 1.0)
            .animation(isAnimating ? Animation.easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true) : .default)
        
    }
}

struct Rotating: ViewModifier {
    @Binding var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(isAnimating ? Animation.linear(duration: 2).repeatForever(autoreverses: false) : .default)
    }
}

struct Glowing: ViewModifier {
    @Binding var isAnimating: Bool
    var color: String
    
    func body(content: Content) -> some View {
        content
            .shadow(color: isAnimating ? Color(UIColor(hex: color)) : .clear, radius: 10, x: 0.0, y: 0.0)
            .animation(isAnimating ? Animation.easeInOut(duration: 1).repeatForever(autoreverses: true) : .default)
    }
}

struct Bouncing: ViewModifier {
    @Binding var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .offset(y: isAnimating ? -10 : 10)
            .animation(isAnimating ? Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true) : .default)
    }
}

struct Wobble: ViewModifier {
    @Binding var isAnimating: Bool
    let angle: Double
    let repeatCount: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isAnimating ? angle : 0))
            .animation(
                isAnimating ?
                Animation.linear(duration: 0.2)
                    .repeatForever(autoreverses: true)
                : .default
            )
    }
}

struct SoftShadow: ViewModifier {
    var color: String = "194BFB"
    var radius: CGFloat = 20
    var x: CGFloat = 0
    var y: CGFloat = 10
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(UIColor(hex: color)).opacity(0.4), radius: radius, x: x, y: y)
    }
}



extension View {
    public func pulsing(isAnimating: Binding<Bool>) -> some View {
        self.modifier(Pulsing(isAnimating: isAnimating))
    }
    
    public func rotating(isAnimating: Binding<Bool>) -> some View {
        self.modifier(Rotating(isAnimating: isAnimating))
    }
    
    public func glowing(isAnimating: Binding<Bool>, color: String) -> some View {
        self.modifier(Glowing(isAnimating: isAnimating, color: color))
    }
    
    public func bouncing(isAnimating: Binding<Bool>) -> some View {
        self.modifier(Bouncing(isAnimating: isAnimating))
    }
    
    public func wobble(isAnimating: Binding<Bool>, angle: Double = 5, repeatCount: Double = .infinity) -> some View {
        self.modifier(Wobble(isAnimating: isAnimating, angle: angle, repeatCount: repeatCount))
    }
    
    public func softShadow(color: String = "194BFB", radius: CGFloat = 10, x: CGFloat = 0, y: CGFloat = 10) -> some View {
        self.modifier(SoftShadow(color: color, radius: radius, x: x, y: y))
    }
}


