//
//  CreateFlashcardsVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 08/09/2021.
//

import Foundation
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
        configureFlashcardFrontText()
    }

    func configureFlashcardFrontText(){
        flashcardFrontText.translatesAutoresizingMaskIntoConstraints = false
        flashcardFrontText.text = "Flashcard Front"
        flashcardFrontText.textColor = .systemBlue
        flashcardFrontText.backgroundColor = .white
        flashcardFrontText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 43).isActive = true
        flashcardFrontText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 43).isActive = true
        flashcardFrontText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 43).isActive = true
        flashcardFrontText.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    

}
