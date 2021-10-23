//
//  Flashcard.swift
//  Memorius
//
//  Created by Devron Tombacco on 17/09/2021.
//

import UIKit
import RealmSwift

class Flashcard: Object {
    @Persisted var question = ""
    @Persisted var answer = ""
    
    convenience init(question: String, answer: String) {
        self.init()
        self.question = question
        self.answer = answer
    }
}

