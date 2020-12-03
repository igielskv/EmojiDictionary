//
//  EmojiDetailView.swift
//  EmojiDictionary
//
//  Created by Manolis on 29.11.2020.
//

import SwiftUI

struct EmojiDetailView: View {
    var emoji: Emoji
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Symbol")) {
                    Text(emoji.symbol)
                }
                
                Section(header: Text("Name")) {
                    Text(emoji.name)
                }
                
                Section(header: Text("Description")) {
                    Text(emoji.description)
                }
                
                Section(header: Text("Usage")) {
                    Text(emoji.usage)
                }
            }
            .navigationTitle("Emoji Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(emoji: EmojiViewModel().emojis[0])
    }
}
