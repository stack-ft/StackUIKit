//
//  Cards.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/2/23.
//

import SwiftUI
import AlertToast

struct Card1: View {
    let config: CardConfiguration
    @State var isVisible: Bool = false
    var body: some View {
        ZStack {
            Color.clear
            cardBackground(background: config.primaryColor, cornerRadius: config.cornerRadius)
                .overlay(
                    Image(named: config.cardOverlayImg)
                        .resizable()
                        .scaledToFill()
                        .mask(RoundedRectangle(cornerRadius: config.cornerRadius))
                )
                .overlay(
                    VStack(spacing: 5) {
                        HStack {
                            Spacer()
                            Text(config.brandName)
                                .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.7)))
                                .font(getFont(config: config.font, size: 20))
                                .fontWeight(.bold)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        Spacer()
                        HStack(spacing: 10) {
                            Text("Balance")
                                .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.7)))
                                .font(getFont(config: config.font, size: 16))
                                .fontWeight(.regular)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Button(action: togglevisibility) {
                                Image(isVisible ? "hide" : "view", bundle: bundle)
                                    .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.7)))
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Text(isVisible ? config.amount : "***")
                                .foregroundColor(Color(UIColor(hex: config.textColor)))
                                .font(getFont(config: config.font, size: 25))
                                .fontWeight(.black)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            Spacer()
                            Image(config.cardBrand.imageName, bundle: bundle)
                        }
                    }.padding(25)
                )
        }
    }
    
    private func togglevisibility() {
        isVisible.toggle()
    }
}

struct BalanceCard2: View {
    let config: CardConfiguration
    public var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(Color(UIColor(hex: config.primaryColor)))
                .frame(width: .infinity, height: 170)
                .overlay(
                    VStack {
                        
                        HStack {
                            Text("Balance")
                                .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.5)))
                                .font(getFont(config: config.font, size: 16))
                                .fontWeight(.regular)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Button(action: {
                                self.action()
                            }) {
                                Image(stackIcon: .dots_vertical_fill)
                                    .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.5)))
                            }
                        }
                        
                        Spacer()
                        
                        
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 3) {
                                    Text(config.amount)
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 38))
                                        .fontWeight(.bold)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    
                                    Text(config.currency)
                                        .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.5)))
                                        .font(getFont(config: config.font, size: 25))
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    
                                }
                                
                                Text(formattedDate())
                                    .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.5)))
                                    .font(getFont(config: config.font, size: 16))
                                    .fontWeight(.regular)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                
                            }
                            
                            Spacer()
                        }
                        
                    }.padding(25)
                )
        }
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: Date())
    }
}

struct DebitCard1: View {
    let config: CardConfiguration
    @State var isVisible: Bool = false
    //TOAST
    @State var copyNumber: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
            cardBackground(background: config.primaryColor, cornerRadius: config.cornerRadius)
                .offset(y: isVisible ? 70 : 0)
                .overlay (
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Card CVV")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 10))
                                    .fontWeight(.regular)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Text(config.cardData?.cvv ?? "")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 15))
                                    .fontWeight(.medium)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                
                            }
                            Spacer()
                        }
                    }
                    .offset(y: isVisible ? 70 : 0)
                    .padding(25)
                    
                )
            cardBackground(background: config.primaryColor, cornerRadius: config.cornerRadius)
                .softShadow(color: "232B38", show: isVisible)
                .overlay(
                    Image(named: config.cardOverlayImg)
                        .resizable()
                        .scaledToFill()
                        .mask(RoundedRectangle(cornerRadius: config.cornerRadius))
                )
                .overlay (
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: toggleVisibility) {
                                Image(isVisible ? "hide" : "view", bundle: bundle)
                                    .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.9)))
                            }
                            Spacer()
                            Text(config.brandName)
                                .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.9)))
                                .font(getFont(config: config.font, size: 20))
                                .fontWeight(.bold)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        Spacer()

                        Text(isVisible ? config.cardData?.pan ?? "" : "**** \(config.cardData?.pan.suffix(4) ?? "")")
                            .foregroundColor(Color(UIColor(hex: config.textColor)))
                            .font(getFont(config: config.font, size: 25))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .toast(isPresenting: $copyNumber, alert: {
                                AlertToast(type: .regular, title: "Copied!")
                            },completion: {
                                copyNumber = false
                             })
                            .onTapGesture {
                                copyNumber = true
                            }

                        Spacer()

                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Card Holder name")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 10))
                                    .fontWeight(.regular)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Text(config.cardData?.cardHolder ?? "")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 15))
                                    .fontWeight(.medium)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)

                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Expiry date")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 10))
                                    .fontWeight(.regular)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Text(config.cardData?.expDate ?? "")
                                    .foregroundColor(Color(UIColor(hex: config.textColor)))
                                    .font(getFont(config: config.font, size: 15))
                                    .fontWeight(.medium)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                            }
                            Spacer()
                            Image(config.cardBrand.imageName, bundle: bundle)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 35)
                        }

                    }.padding(25)
                )
        }
    }
    
    private func toggleVisibility() {
        withAnimation {
            isVisible.toggle()
        }
    }
}

struct DebitCard2: View {
    let config: CardConfiguration
    @State var isVisible: Bool = false
    //TOAST
    @State var copyNumber: Bool = false
    
    var body: some View {
        VStack(spacing: 0) { // VStack to stack the views vertically
            ZStack {
                cardBackground(background: config.primaryColor, cornerRadius: config.cornerRadius)
                    .overlay(
                        Image(named: config.cardOverlayImg)
                            .resizable()
                            .scaledToFill()
                            .mask(RoundedRectangle(cornerRadius: config.cornerRadius))
                    )
                    .overlay (
                        VStack(alignment: .leading) {
                            HStack {
                                Button(action: toggleVisibility) {
                                    Image(isVisible ? "hide" : "view", bundle: bundle)
                                        .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.9)))
                                }
                                Spacer()
                                Text(config.brandName)
                                    .foregroundColor(Color(UIColor(hex: config.textColor, alpha: 0.9)))
                                    .font(getFont(config: config.font, size: 20))
                                    .fontWeight(.bold)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                            }
                            Spacer()

                            Text(isVisible ? config.cardData?.pan ?? "" : "**** \(config.cardData?.pan.suffix(4) ?? "")")
                                .foregroundColor(Color(UIColor(hex: config.textColor)))
                                .font(getFont(config: config.font, size: 25))
                                .fontWeight(.bold)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                                .toast(isPresenting: $copyNumber, alert: {
                                    AlertToast(type: .regular, title: "Copied!")
                                },completion: {
                                    copyNumber = false
                                 })
                                .onTapGesture {
                                    copyNumber = true
                                }

                            Spacer()

                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Card Holder name")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 10))
                                        .fontWeight(.regular)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    Text(config.cardData?.cardHolder ?? "")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 15))
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)

                                }
                                Spacer()
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Expiry date")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 10))
                                        .fontWeight(.regular)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    Text(config.cardData?.expDate ?? "")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 15))
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                }
                                Spacer()
                                Image(config.cardBrand.imageName, bundle: bundle)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 35)
                            }

                        }.padding(25)
                    )
            }
            ZStack {
                Color.clear
                RoundedRectangle(cornerRadius: config.cornerRadius)
                    .fill(Color(UIColor(hex: "config.primaryColor")))
                    .overlay (
                        VStack {
                            Spacer()
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Card CVV")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 10))
                                        .fontWeight(.regular)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    Text(config.cardData?.cvv ?? "")
                                        .foregroundColor(Color(UIColor(hex: config.textColor)))
                                        .font(getFont(config: config.font, size: 15))
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                }
                                Spacer()
                            }
                        }
                        .padding(25)
                    )
                .opacity(isVisible ? 1 : 0) // Show/hide based on isVisible
            }
            .frame(height: isVisible ? 100 : 0) // Adjust height based on isVisible
            
        }
    }
    
    private func toggleVisibility() {
        withAnimation {
            isVisible.toggle()
        }
    }
}


struct InformationCard1: View {
    let config: CardConfiguration
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .fill(.white)
                .frame(width: .infinity, height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .stroke(Color(UIColor(hex: config.primaryColor)), lineWidth: 1)
                )
                .overlay(
                    HStack(spacing: 10) {
                        ZStack{
                            Circle()
                                .fill(Color(UIColor(hex: "F7FAFC")))
                                .frame(width: 50, height: 50)
                            
                            Image("bell", bundle: bundle)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(config.informationTitle)
                                .foregroundColor(Color(UIColor(hex: "1A202C")))
                                .font(getFont(config: config.font, size: 16))
                                .fontWeight(.medium)
                            Text(config.informationBody)
                                .foregroundColor(Color(UIColor(hex: "718096")))
                                .font(getFont(config: config.font, size: 13))
                                .fontWeight(.regular)
                        }
                        
                        Spacer()
                    }.padding()
                )
        }
    }
}

@ViewBuilder
private func cardBackground(background: String, cornerRadius: CGFloat) -> some View {
    RoundedRectangle(cornerRadius: cornerRadius)
        .fill(Color(UIColor(hex: background)))
        .frame(width: .infinity, height: 230)
}
