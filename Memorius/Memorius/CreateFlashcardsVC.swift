//
//  CreateFlashcardsVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 08/09/2021.
//

import UIKit

class CreateFlashcardsVC: UIViewController {

    // MARK:-- UIElements
    let flascardFrontText = UILabel()
    let flascardBackText = UILabel()
    let flashcardFrontTextfield = UITextField()
    let flashcardBackTextfield = UITextField()
    let deckPicker = UIPickerView()
    let createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Create Flashcards"
    }


    

}
