//
//  Deck.swift
//  Memorius
//
//  Created by Devron Tombacco on 17/09/2021.
//

import Foundation
import UIKit
import RealmSwift

class Deck: Object {
    
    @Persisted var name = ""
    @Persisted var flashcardArray = List<Flashcard>()
    @Persisted var lastScore: Int = 0
    @Persisted var highScore: Int = 0
    @Persisted var lastRunthrough: Date
    @Persisted var createdDate: Date
    @Persisted var deckDescription: String = ""
    convenience init(name: String) {
        self.init()
        self.name = name
        self.flashcardArray = flashcardArray
        self.lastScore = lastScore
        self.highScore = highScore
        self.lastRunthrough = lastRunthrough
    }
    
}
