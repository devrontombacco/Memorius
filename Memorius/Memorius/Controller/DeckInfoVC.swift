//
//  DeckInfoVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 07/10/2021.
//

import UIKit

class DeckInfoVC: UIViewController {

    let deckDescriptionLabel = UILabel()
    var deckDescriptionTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Deck Title here"
        
        view.addSubview(deckDescriptionLabel)
        view.addSubview(deckDescriptionTextView)
        
        configureDeckDescriptionLabel()
        configureDeckDescriptionTextView()
        deckDescriptionTextView.delegate = self
            
        view.backgroundColor = .white
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
    
    func configureDeckDescriptionTextView(){
        
        deckDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        deckDescriptionTextView.topAnchor.constraint(equalTo: deckDescriptionLabel.bottomAnchor, constant: 20).isActive = true
        deckDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        .isActive = true
        deckDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deckDescriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deckDescriptionTextView.heightAnchor.constraint(equalToConstant: 90).isActive = true

        deckDescriptionTextView.textColor = .black
        deckDescriptionTextView.backgroundColor = .white
        deckDescriptionTextView.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        deckDescriptionTextView.textAlignment = .center
        deckDescriptionTextView.returnKeyType = .next
        deckDescriptionTextView.layer.cornerRadius = 10
        deckDescriptionTextView.layer.borderWidth = 1.0
        deckDescriptionTextView.layer.borderColor = UIColor.systemBlue.cgColor
        deckDescriptionTextView.isEditable = true

    }
    

}

extension DeckInfoVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        print("User has begun editing Deck Description TextField")
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}
