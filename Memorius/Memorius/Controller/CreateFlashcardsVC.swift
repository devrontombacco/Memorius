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
    let flashcardBackTextfield = UITextField()
    let deckPickerView = UIPickerView()
    
    let testDeckArray = ["Deck 1", "Deck 2", "Deck 3", "Deck 4", "Deck 5", "Deck 6"]
    
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
        
        // flashcardBackTextfield
        view.addSubview(flashcardBackTextfield)
        configureFlashcardBackTextfield()
        flashcardBackTextfield.delegate = self
        
        // deckPickerView
        view.addSubview(deckPickerView)
        configureDeckPickerView()
        deckPickerView.delegate = self
        deckPickerView.dataSource = self
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
    
    func configureFlashcardBackTextfield(){
        flashcardBackTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        flashcardBackTextfield.topAnchor.constraint(equalTo: flashcardBackTextLabel.bottomAnchor, constant: 50).isActive = true
        flashcardBackTextfield.leadingAnchor.constraint(equalTo: flashcardFrontTextLabel.leadingAnchor).isActive = true
        flashcardBackTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        flashcardBackTextfield.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        flashcardBackTextfield.placeholder = "Insert answer here..."
        flashcardBackTextfield.textColor = .systemBlue
        flashcardBackTextfield.backgroundColor = .white
        flashcardBackTextfield.textAlignment = .left
        flashcardBackTextfield.borderStyle = .roundedRect
        flashcardBackTextfield.keyboardAppearance = .default
        flashcardBackTextfield.keyboardType = .default
        flashcardBackTextfield.font = UIFont.systemFont(ofSize: 12)
        flashcardBackTextfield.returnKeyType = .done
        flashcardBackTextfield.clearButtonMode = .whileEditing
    }
    
    func configureDeckPickerView(){
        deckPickerView.translatesAutoresizingMaskIntoConstraints = false
        deckPickerView.topAnchor.constraint(equalTo: flashcardBackTextfield.bottomAnchor, constant: 20).isActive = true
        deckPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        deckPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deckPickerView.backgroundColor = .white
    }

}

extension CreateFlashcardsVC: UITextFieldDelegate {
    
    // dismiss keyboard when tap return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == flashcardFrontTextfield {
            flashcardFrontTextfield.resignFirstResponder()
        } else {
            flashcardBackTextfield.resignFirstResponder()
        }
        return true
    }
    
    // dismiss keyboard when tap outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CreateFlashcardsVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testDeckArray.count
    }
    
    
}

extension CreateFlashcardsVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testDeckArray[row]
    }
}