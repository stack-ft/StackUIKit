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
            VStack(alignment: .leading, spacing: 10) {
                Text(text)
                    .font(getFont(config: font, size: style.fontSize))
                    .fontWeight(style.fontWeight)
                    .foregroundColor((font.textColor != nil) ? font.textColor : style.textColor)
                
                if let url = detectURL(text: text){
                    // Use LinkViewRepresentable for detected URLs
                    LinkViewRepresentable(metadata: getMetadata(url: url))
                }
            }
        }
    }
    
    private func getMetadata(url: URL) -> LPLinkMetadata {
        let metadata = LPLinkMetadata()
        metadata.originalURL = url
        return metadata
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


class CustomLinkView: LPLinkView {
    override var intrinsicContentSize: CGSize { CGSize(width: 0, height: super.intrinsicContentSize.height) }
}

struct LinkViewRepresentable: UIViewRepresentable {
 
    typealias UIViewType = CustomLinkView
    
    var metadata: LPLinkMetadata?
 
    func makeUIView(context: Context) -> CustomLinkView {
        let provider = LPMetadataProvider()
        
        guard let originalURL = metadata?.originalURL else {
            return CustomLinkView()
        }
        guard let metadata = metadata else {
            return CustomLinkView()
        }
        let linkView = CustomLinkView(metadata: metadata)
        
        // Fetch metadata for the original URL
        provider.startFetchingMetadata(for: originalURL) { fetchedMetadata, _ in
            DispatchQueue.main.async {
                if let fetchedMetadata = fetchedMetadata {
                    linkView.metadata = fetchedMetadata
                }
            }
        }
        
        return linkView
    }

 
    func updateUIView(_ uiView: CustomLinkView, context: Context) {
    }
}
