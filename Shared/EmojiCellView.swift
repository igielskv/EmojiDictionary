//
//  EmojiCellView.swift
//  EmojiDictionary
//
//  Created by Manolis on 29.11.2020.
//

import SwiftUI

struct EmojiCellView: View {
    var emoji: Emoji
    
    var body: some View {
        NavigationLink(destination: EmojiDetailView(emoji: emoji)) {
            HStack {
                Text(emoji.symbol)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading) {
                    Text(emoji.name)
                        .font(.title3)
                    Text(emoji.description)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct EmojiCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCellView(emoji: EmojiViewModel().emojis[0])
    }
}
