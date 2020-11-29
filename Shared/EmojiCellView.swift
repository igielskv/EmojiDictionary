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
        VStack(alignment: .leading) {
            Text("\(emoji.symbol) - \(emoji.name)")
            Text("\(emoji.description)")
                .font(.caption)
        }
    }
}

struct EmojiCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCellView(emoji: EmojiViewModel().emojis[0])
    }
}
