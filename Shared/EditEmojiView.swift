//
//  EditEmojiView.swift
//  EmojiDictionary
//
//  Created by Manolis on 29.11.2020.
//

import SwiftUI

struct EditEmojiView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var emojiViewModel: EmojiViewModel
    @State var emoji: Emoji
    
    var emojiIndex: Int {
        emojiViewModel.emojis.firstIndex(where: { $0.id == emoji.id })!
    }
    
    var body: some View {
        NavigationView {
            EmojiFormView(emoji: $emoji)
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
        EditEmojiView(emoji: EmojiViewModel().emojis[0])
            .environmentObject(EmojiViewModel())
    }
}
