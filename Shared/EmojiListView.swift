//
//  EmojiListView.swift
//  EmojiDictionary
//
//  Created by Manolis on 28.11.2020.
//

import SwiftUI

struct EmojiListView: View {
    @ObservedObject var emojiViewModel: EmojiViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiViewModel.emojis, id: \.self) { emoji in
                    EmojiCellView(emoji: emoji)
                }
                .onDelete(perform: deleteEmojis)
                .onMove(perform: moveEmojis)
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
    
    func deleteEmojis(offsets: IndexSet) {
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
