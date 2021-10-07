//
//  DeckInfoVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 07/10/2021.
//

import UIKit

class DeckInfoVC: UIViewController {

    let deckDescriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Deck Title here"
        
        view.addSubview(deckDescriptionLabel)
        configureDeckDescriptionLabel()
        
    }
    
    func configureDeckDescriptionLabel() {
        
        deckDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        deckDescriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        deckDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        .isActive = true
        deckDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deckDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deckDescriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        deckDescriptionLabel.text = "Description"
        deckDescriptionLabel.textColor = .black
        deckDescriptionLabel.backgroundColor = .white
        deckDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        deckDescriptionLabel.textAlignment = .center
        deckDescriptionLabel.numberOfLines = 0
        deckDescriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    

}
