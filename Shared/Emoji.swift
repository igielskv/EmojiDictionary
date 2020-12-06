//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Manolis on 28.11.2020.
//

import Foundation

struct Emoji: Identifiable {
    let id = UUID()
    var symbol: String
    var name: String
    var description: String
    var usage: String
}
