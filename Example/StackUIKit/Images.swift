//
//  Images.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/10/23.
//

import SwiftUI

struct ExpandableImageView: View {
    @State private var isExpanded: Bool = false
    let image: Image

    init(image: Image) {
        self.image = image
    }

    var body: some View {
        ZStack {
            if isExpanded {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }

                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            } else {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
        }
    }
}
