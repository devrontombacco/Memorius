//
//  CreateFlashcardsVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 08/09/2021.
//


import UIKit
class CreateFlashcardsVC: UIViewController {

    // MARK:-- UIElements
    let flashcardFrontTextLabel = UILabel()
    let flashcardFrontTextfield = UITextField()
    let flashcardBackTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //VC properties
        view.backgroundColor = .white
        navigationItem.title = "Create Flashcards"
        
        // flashcardFrontText
        view.addSubview(flashcardFrontTextLabel)
        configureFlashcardFrontTextLabel()
        
        // flashcardFrontTextfield
        view.addSubview(flashcardFrontTextfield)
        configureFlashcardFrontTextfield()
        flashcardFrontTextfield.delegate = self
        
        // flashcardBackTextLabel
        view.addSubview(flashcardBackTextLabel)
        configureFlashcardBackTextLabel()
        
    }

    func configureFlashcardFrontTextLabel(){
        flashcardFrontTextLabel.translatesAutoresizingMaskIntoConstraints = false
        flashcardFrontTextLabel.text = "Flashcard Front"
        flashcardFrontTextLabel.textColor = .systemBlue
        flashcardFrontTextLabel.backgroundColor = .white
        flashcardFrontTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 43).isActive = true
        flashcardFrontTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        flashcardFrontTextLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        flashcardFrontTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        flashcardFrontTextLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func configureFlashcardBackTextLabel(){
        flashcardBackTextLabel.translatesAutoresizingMaskIntoConstraints = false
        flashcardBackTextLabel.text = "Flashcard Back"
        flashcardBackTextLabel.textColor = .systemBlue
        flashcardBackTextLabel.backgroundColor = .white
        flashcardBackTextLabel.topAnchor.constraint(equalTo: flashcardFrontTextfield.bottomAnchor, constant: 50).isActive = true
        flashcardBackTextLabel.leadingAnchor.constraint(equalTo: flashcardFrontTextfield.leadingAnchor).isActive = true
        flashcardBackTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        flashcardBackTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        flashcardBackTextLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func configureFlashcardFrontTextfield(){
        flashcardFrontTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        flashcardFrontTextfield.topAnchor.constraint(equalTo: flashcardFrontTextLabel.bottomAnchor, constant: 50).isActive = true
        flashcardFrontTextfield.leadingAnchor.constraint(equalTo: flashcardFrontTextLabel.leadingAnchor).isActive = true
        flashcardFrontTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        flashcardFrontTextfield.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        flashcardFrontTextfield.placeholder = "Insert question here..."
        flashcardFrontTextfield.textColor = .systemBlue
        flashcardFrontTextfield.backgroundColor = .white
        flashcardFrontTextfield.textAlignment = .left
        flashcardFrontTextfield.borderStyle = .roundedRect
        flashcardFrontTextfield.keyboardAppearance = .default
        flashcardFrontTextfield.keyboardType = .default
        flashcardFrontTextfield.font = UIFont.systemFont(ofSize: 12)
        flashcardFrontTextfield.returnKeyType = .done
        flashcardFrontTextfield.clearButtonMode = .whileEditing
    }

}

extension CreateFlashcardsVC: UITextFieldDelegate {
    
    // dismiss keyboard when tap return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        flashcardFrontTextfield.resignFirstResponder()
        return true
    }
    
    // dismiss keyboard when tap outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
