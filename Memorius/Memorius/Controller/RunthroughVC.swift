//
//  RunthroughVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 10/10/2021.
//

import UIKit

class RunthroughVC: UIViewController {

    // MARK: -- UILABELS
    let deckRunthroughNoLabel = UILabel()
    let deckFlashcardNoLabel = UILabel()
    
    // MARK: -- UISTACKVIEWS
    let deckDetailsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Runthrough: (Deck Name Here)"
        
        view.addSubview(deckDetailsStackView)
        view.addSubview(deckRunthroughNoLabel)
        view.addSubview(deckFlashcardNoLabel)
        
        configureDeckLabels()
        configureDeckDetailsStackView()
        configuredeckDetailsStackViewLabelImages()
    }
    
    func configureDeckLabels() {
        
        deckRunthroughNoLabel.translatesAutoresizingMaskIntoConstraints = false
        deckRunthroughNoLabel.text = " Runthroughs"
        deckRunthroughNoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckRunthroughNoLabel.textColor = .systemBlue
        deckRunthroughNoLabel.backgroundColor = .white
        deckRunthroughNoLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        deckRunthroughNoLabel.textAlignment = .center
        
        deckFlashcardNoLabel.translatesAutoresizingMaskIntoConstraints = false
        deckFlashcardNoLabel.text = " Runthroughs"
        deckFlashcardNoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckFlashcardNoLabel.textColor = .systemBlue
        deckFlashcardNoLabel.backgroundColor = .white
        deckFlashcardNoLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        deckFlashcardNoLabel.textAlignment = .center

    }
    
    func configureDeckDetailsStackView(){
        
        deckDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        deckDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        deckDetailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        deckDetailsStackView.addArrangedSubview(deckRunthroughNoLabel)
        deckDetailsStackView.addArrangedSubview(deckFlashcardNoLabel)

        deckDetailsStackView.axis = .horizontal
        deckDetailsStackView.backgroundColor = .white
        deckDetailsStackView.distribution = .fillEqually
        deckDetailsStackView.spacing = 30
        deckDetailsStackView.alignment = .center
        
    }



}
