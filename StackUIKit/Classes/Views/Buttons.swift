//
//  Buttons.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/1/23.
//

import SwiftUI

struct Button1: View {
    
    public var action: () -> Void
    public var label: String
    public var config: ButtonConfiguation
    
    public init(action: @escaping () -> Void, label: String = "Primary Button", config: ButtonConfiguation) {
        self.action = action
        self.label = label
        self.config = config
    }
    
    var body: some View {
        Button(action: self.action) {
            Text(self.label)
                .font(getFont(config: config.font, size: 15))
                .fontWeight(config.size == .large ? .bold : .medium)
                .frame(maxWidth: widthForButton())
                .padding(.vertical, heightForButton())
                .padding()
                .background(Color( UIColor(hex: config.primaryColor, alpha: config.disabled ? 0.8 : 1.0)))
                .foregroundColor(Color(UIColor(hex: config.textColor)))
                .cornerRadius(config.cornerRadius)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        .disabled(config.disabled)
    }
    
    
    func widthForButton() -> CGFloat {
        switch config.width {
        case .full:
            return .infinity
        case .half:
            return UIScreen.main.bounds.width / 2
        case .quarter:
            return UIScreen.main.bounds.width / 4
        }
    }
    
    func heightForButton() -> CGFloat {
        switch config.size {
        case .large:
            return 10.0
        case .medium:
            return 3.0
        case .small:
            return -5.0
        }
    }
}

struct Button2: View {
    
    public var action: () -> Void
    public var label: String
    public var config: ButtonConfiguation
    
    public init(action: @escaping () -> Void, label: String = "Secondary Button", config: ButtonConfiguation) {
        self.action = action
        self.label = label
        self.config = config
    }
    
    var body: some View {
        Button(action: self.action) {
            Text(self.label)
                .font(getFont(config: config.font, size: 15))
                .fontWeight(config.size == .large ? .bold : .medium)
                .frame(minWidth: 0, maxWidth: widthForButton())
                .padding()
                .background(Color.clear)
                .foregroundColor(Color(UIColor(hex: config.textColor)))
                .overlay(
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color( UIColor(hex: config.primaryColor, alpha: config.disabled ? 0.8 : 1.0)), lineWidth: 2)
                )
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        
        
    }
    
    
    func widthForButton() -> CGFloat? {
        switch config.width {
        case .full:
            return .infinity
        case .half:
            return UIScreen.main.bounds.width / 2
        case .quarter:
            return UIScreen.main.bounds.width / 4
        }
    }
    
    func heightForButton() -> CGFloat {
        switch config.size {
        case .large:
            return 10.0
        case .medium:
            return 3.0
        case .small:
            return -5.0
        }
    }
}

struct Button3: View {
    
    public var action: () -> Void
    public var config: ButtonConfiguation
    
    public init(action: @escaping () -> Void, config: ButtonConfiguation) {
        self.action = action
        self.config = config
    }
    
    var body: some View {
        Button(action: self.action) {
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(UIColor(hex: config.primaryColor)))
                config.image
                    .foregroundColor(Color(UIColor(hex: config.textColor)))
            }
        }
        
    }
}

struct Button4: View {
    let actions: [() -> Void]
    @State private var isExpanded = false
    private let radius: CGFloat = 60  // Radius of the circle of buttons
    
    let config: ButtonConfiguation
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<actions.count, id: \.self) { index in
                    // Calculate angle for each button, spreading them evenly
                    let angle = 2 * .pi / CGFloat(actions.count) * CGFloat(index)
                    // Calculate x and y position for each button
                    let x = self.isExpanded ? radius * cos(angle) : 0
                    let y = self.isExpanded ? radius * sin(angle) : 0
                    
                    Button(action: {
                        // Handle each button tap action
                        self.actions[index]()
                    }) {
                        Image(stackIcon: .plus)
                            .frame(width: 50, height: 50)
                            .background(Color(UIColor(hex: config.primaryColor)))
                            .foregroundColor(Color(UIColor(hex: config.textColor)))
                            .cornerRadius(50)
                    }
                    .transition(.opacity)
                    .position(x: geometry.size.width / 2 + x, y: geometry.size.height / 2 + y)
                    .animation(Animation.easeOut(duration: 0.5).delay(Double(index) * 0.1))
                }
                
                Button(action: {
                    withAnimation {
                        self.isExpanded.toggle()
                    }
                }) {
                    config.image
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(Color(UIColor(hex: config.primaryColor)))
                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                        .cornerRadius(50)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
        // Ensure enough space around the central button for the radial buttons
        .frame(width: 2 * radius + 50, height: 2 * radius + 50)
    }
}

struct Button5: View {
    public var action: () -> Void
    public var config: ButtonConfiguation
    @State var isLiked: Bool
    @State private var animate: Bool = false
    
    public init(action: @escaping () -> Void, config: ButtonConfiguation) {
        self.action = action
        self.config = config
        self.isLiked = config.isLiked
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isLiked.toggle()
                self.animate = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    self.animate = false
                }
            }
            self.action()
        }) {
            Image(stackIcon: isLiked ? .heart_fill : .heart_outline)
                .foregroundColor(Color(UIColor(hex: config.primaryColor)))
                .padding()
                .scaleEffect(animate ? 1.2 : 1.0)
                .rotationEffect(animate ? .degrees(10) : .degrees(0))
        }
    }
}

