//
//  EmojiDetailView.swift
//  EmojiDictionary
//
//  Created by Manolis on 29.11.2020.
//

import SwiftUI

struct EmojiDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var emojiViewModel: EmojiViewModel
    @State var emoji: Emoji
    
    var emojiIndex: Int {
        emojiViewModel.emojis.firstIndex(where: { $0.id == emoji.id })!
    }
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Edit Emoji")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        emojiViewModel.updateEmoji(at: emojiIndex, with: emoji)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(emoji: EmojiViewModel().emojis[0])
            .environmentObject(EmojiViewModel())
    }
}
