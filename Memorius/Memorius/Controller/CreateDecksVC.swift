//
//  CreateDecksVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 21/10/2021.
//

import UIKit

class CreateDecksVC: UIViewController {

    // MARK:-- UILabels
    let createNewDeckLabel = MemSectionHeading()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(createNewDeckLabel)
        
        configureCreateNewDeckLabel()
    }
    
    func configureCreateNewDeckLabel(){
        
        createNewDeckLabel.text = "New Deck name"
        createNewDeckLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 43).isActive = true
        createNewDeckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        createNewDeckLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        createNewDeckLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    

}
