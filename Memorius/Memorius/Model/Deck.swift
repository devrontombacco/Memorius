//
//  Deck.swift
//  Memorius
//
//  Created by Devron Tombacco on 17/09/2021.
//

import Foundation
import UIKit

class Deck {
    
    var name: String
    var flashcardArray: [Flashcard] = []
    
    init(name: String, flashcardArray: Array<Flashcard>){
        self.name = name
        self.flashcardArray = flashcardArray
    }
}
