//
//  EmojiFormView.swift
//  EmojiDictionary
//
//  Created by Manolis on 06.12.2020.
//

import SwiftUI

struct EmojiFormView: View {
    @Binding var emoji: Emoji
    
    var body: some View {
        Form {
            Section(header: Text("Symbol")) {
                TextField("Symbol", text: $emoji.symbol)
            }
            
            Section(header: Text("Name")) {
                TextField("Name", text: $emoji.name)
            }
            
            Section(header: Text("Description")) {
                TextField("Description", text: $emoji.description)
            }
            
            Section(header: Text("Usage")) {
                TextField("Usage", text: $emoji.usage)
            }
        }
    }
}

struct EmojiFormView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiFormView(emoji: .constant(EmojiViewModel().emojis[0]))
    }
}
