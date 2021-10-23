//
//  CreateDecksVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 21/10/2021.
//

import UIKit

protocol CreateDecksVCDelegate {
    func createDeck(newlyCreatedDeck: Deck)
}

class CreateDecksVC: UIViewController {

    // MARK:-- UILabels
    let createNewDeckLabel = MemSectionHeading()
    
    // MARK:-- UITextfields
    let createNewDeckTextfield = UITextField()
    
    // MARK: -- UIButtons
    let createNewDeckButton = UIButton()
    
    // MARK: -- Delegates
    var delegate: CreateDecksVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Add New Deck"
        view.addSubview(createNewDeckLabel)
        view.addSubview(createNewDeckTextfield)
        view.addSubview(createNewDeckButton)
        
        
        configureCreateNewDeckLabel()
        configureCreateNewDeckTextfield()
        configureCreateNewDeckButton()
    }
    
    func configureCreateNewDeckLabel(){
        
        createNewDeckLabel.text = "New Deck name"
        createNewDeckLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 43).isActive = true
        createNewDeckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        createNewDeckLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        createNewDeckLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func configureCreateNewDeckTextfield(){
        
        createNewDeckTextfield.translatesAutoresizingMaskIntoConstraints = false
        createNewDeckTextfield.topAnchor.constraint(equalTo: createNewDeckLabel.bottomAnchor, constant: 30).isActive = true
        createNewDeckTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        createNewDeckTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        createNewDeckTextfield.heightAnchor.constraint(equalToConstant: 75).isActive = true
        createNewDeckTextfield.placeholder = "Deck name here..."
        createNewDeckTextfield.textColor = .systemBlue
        createNewDeckTextfield.backgroundColor = .white
        createNewDeckTextfield.textAlignment = .left
        createNewDeckTextfield.borderStyle = .roundedRect
        createNewDeckTextfield.keyboardAppearance = .default
        createNewDeckTextfield.keyboardType = .default
        createNewDeckTextfield.font = UIFont.systemFont(ofSize: 12)
        createNewDeckTextfield.returnKeyType = .done
        createNewDeckTextfield.clearButtonMode = .whileEditing
        
    }
    
    func configureCreateNewDeckButton(){
        
        createNewDeckButton.translatesAutoresizingMaskIntoConstraints = false
        createNewDeckButton.topAnchor.constraint(equalTo: createNewDeckTextfield.bottomAnchor, constant: 50).isActive = true
        createNewDeckButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createNewDeckButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        createNewDeckButton.setTitle("Create Deck", for: .normal)
        createNewDeckButton.backgroundColor = .systemBlue
        createNewDeckButton.setTitleColor(.white, for: .normal)
        createNewDeckButton.layer.cornerRadius = 7
        createNewDeckButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        createNewDeckButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        createNewDeckButton.addTarget(self, action: #selector(createNewDeckButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func createNewDeckButtonTapped() {
        print("Create New Deck Button tapped")
        if let newDeck = createNewDeckTextfield.text {
            delegate?.createDeck(newlyCreatedDeck: Deck(name: "\(newDeck)") )
            }
        navigationController?.popViewController(animated: true)
    }
    

}

extension CreateDecksVC: UITextFieldDelegate {
    
    // dismiss keyboard when tap return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == createNewDeckTextfield {
            createNewDeckTextfield.resignFirstResponder()
        }
        return true
    }
    
    // dismiss keyboard when tap outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


