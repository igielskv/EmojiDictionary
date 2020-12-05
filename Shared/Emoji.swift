//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Manolis on 28.11.2020.
//

import Foundation

struct Emoji: Hashable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
}

extension Emoji: Identifiable {
    var id: Emoji {
        self
    }
}
