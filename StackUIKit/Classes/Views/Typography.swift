//
//  Typography.swift
//  StackUIKit
//
//  Created by samuel Ailemen on 9/13/23.
//

import SwiftUI
import LinkPresentation

public struct Typography1: View {
    let text: String
    let style: TextStyle
    let font: FontConfigurations
    
    public init(text: String,
                style: TextStyle = .paragraph,
                font: FontConfigurations = FontConfigurations()) {
        self.text = text
        self.style = style
        self.font = font
    }
    public var body: some View {
        Group {
            VStack(spacing: 10) {
                Text(text)
                    .font(getFont(config: font, size: style.fontSize))
                    .fontWeight(style.fontWeight)
                    .foregroundColor((font.textColor != nil) ? font.textColor : style.textColor)
                
                if let url = detectURL(text: text){
                    // Use RichLinkView for detected URLs
                    RichLinkView(url: url)
                }
            }
        }
    }

    
    private func detectURL(text: String) -> URL? {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))

        for match in matches ?? [] {
            if let matchURL = match.url {
                return matchURL
            }
        }
        return nil
    }

}

struct RichLinkView: UIViewRepresentable {
    let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> LPLinkView {
        let view = LPLinkView(url: url)
        view.backgroundColor = .clear
        
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: url) { metadata, _ in
            if let metadata = metadata {
                view.metadata = metadata
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        // This method is required but you don't need to implement anything here
    }
}
