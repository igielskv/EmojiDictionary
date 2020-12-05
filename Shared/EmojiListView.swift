//
//  EmojiListView.swift
//  EmojiDictionary
//
//  Created by Manolis on 28.11.2020.
//

import SwiftUI

struct EmojiListView: View {
    @ObservedObject var emojiViewModel: EmojiViewModel
    @State var selectedEmoji: Emoji? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiViewModel.emojis) { emoji in
                    Button(action: { selectedEmoji = emoji }) {
                        EmojiCellView(emoji: emoji)
                    }
                    .sheet(item: $selectedEmoji) { selectedEmoji in
                        EmojiDetailView(emoji: selectedEmoji)
                    }
                }
                .onMove(perform: moveEmojis)
                .onDelete(perform: deleteEmojis)
            }
            .navigationTitle("Emoji Dictionary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteEmojis(at offsets: IndexSet) {
        emojiViewModel.emojis.remove(atOffsets: offsets)
    }
    
    func moveEmojis(from: IndexSet, to: Int) {
        emojiViewModel.emojis.move(fromOffsets: from, toOffset: to)
    }
}

struct EmojiListView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiListView(emojiViewModel: EmojiViewModel())
    }
}
