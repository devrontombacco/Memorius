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
    
    @objc dynamic var name = ""
    var flashcardArray = List<Flashcard>()
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}
