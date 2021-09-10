//
//  CreateFlashcardsVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 08/09/2021.
//

import UIKit

class CreateFlashcardsVC: UIViewController {

    // MARK:-- UIElements
    let flashcardFrontText = UILabel()
    let flashcardBackText = UILabel()
    let flashcardFrontTextfield = UITextField()
    let flashcardBackTextfield = UITextField()
    let deckPicker = UIPickerView()
    let createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Create Flashcards"
        view.addSubview(flashcardFrontText)
    }


    

}
