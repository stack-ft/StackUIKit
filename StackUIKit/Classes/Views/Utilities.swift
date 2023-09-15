//
//  Utilities.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/13/23.
//

import SwiftUI

public struct StarRatingView: View {
    @State private var animate: Bool = false
    @Binding var rating: Int
    let maxRating: Int
    let starSize: CGFloat
    let onColor: Color
    let offColor: Color
    
    public init(rating: Binding<Int>, maxRating: Int = 5, starSize: CGFloat = 30, onColor: Color = .yellow, offColor: Color = .gray) {
        self._rating = rating
        self.maxRating = maxRating
        self.starSize = starSize
        self.onColor = onColor
        self.offColor = offColor
    }
    
    public var body: some View {
        HStack(spacing: 3) {
            ForEach(Array(1...maxRating), id: \.self) { index in
                Image(stackIcon: index <= self.rating ? .one_star_fill : .one_star_outline)
                    .resizable()
                    .scaledToFit()
                    .frame(width: starSize, height: starSize)
                    .foregroundColor(index <= self.rating ? onColor : offColor)
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .onTapGesture {
                        withAnimation {
                            self.animate = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                self.animate = false
                            }
                        }
                        self.rating = index
                    }
            }
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: .constant(3))
    }
}
