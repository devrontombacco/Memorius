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
    let flashcardExerciseLabel = UILabel()
    
    // MARK: -- UISTACKVIEWS
    let deckDetailsStackView = UIStackView()

    // MARK: -- UIIMAGES
    let runthroughImage = NSTextAttachment()
    let flashcardNoImage = NSTextAttachment()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Runthrough: (Deck Name Here)"
        
        view.addSubview(deckDetailsStackView)
        view.addSubview(deckRunthroughNoLabel)
        view.addSubview(deckFlashcardNoLabel)
        view.addSubview(flashcardExerciseLabel)
        
        configureDeckLabels()
        configureDeckDetailsStackView()
        configuredeckDetailsStackViewLabelImages()
        configureFlashcardExerciseLabel()
    }
    
    func configureDeckLabels() {
        
        deckRunthroughNoLabel.translatesAutoresizingMaskIntoConstraints = false
        deckRunthroughNoLabel.text = " Runthroughs"
        deckRunthroughNoLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        deckRunthroughNoLabel.textColor = .systemBlue
        deckRunthroughNoLabel.backgroundColor = .white
        deckRunthroughNoLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        deckRunthroughNoLabel.textAlignment = .center
        
        deckFlashcardNoLabel.translatesAutoresizingMaskIntoConstraints = false
        deckFlashcardNoLabel.text = " Runthroughs"
        deckFlashcardNoLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        deckFlashcardNoLabel.textColor = .systemBlue
        deckFlashcardNoLabel.backgroundColor = .white
        deckFlashcardNoLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        deckFlashcardNoLabel.textAlignment = .center

    }
    
    func configureDeckDetailsStackView(){
        
        deckDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        deckDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        deckDetailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deckDetailsStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deckDetailsStackView.addArrangedSubview(deckRunthroughNoLabel)
        deckDetailsStackView.addArrangedSubview(deckFlashcardNoLabel)
       

        deckDetailsStackView.axis = .horizontal
        deckDetailsStackView.backgroundColor = .white
        deckDetailsStackView.distribution = .fillEqually
        deckDetailsStackView.spacing = 30
        deckDetailsStackView.alignment = .center
        
    }

    func configuredeckDetailsStackViewLabelImages(){
        
        runthroughImage.image = UIImage(systemName: "figure.walk")
        let deckRunthroughNoLabelFullstring = NSMutableAttributedString(string: " ")
        deckRunthroughNoLabelFullstring.append(NSAttributedString(attachment: runthroughImage))
        deckRunthroughNoLabelFullstring.append(NSAttributedString(string: "  Runthroughs: "))
        deckRunthroughNoLabel.attributedText = deckRunthroughNoLabelFullstring
        
        flashcardNoImage.image = UIImage(systemName: "number")
        let deckFlashcardNoLabelFullstring = NSMutableAttributedString(string: " ")
        deckFlashcardNoLabelFullstring.append(NSAttributedString(attachment: flashcardNoImage))
        deckFlashcardNoLabelFullstring.append(NSAttributedString(string: "  No. Flashcards: "))
        deckFlashcardNoLabel.attributedText = deckFlashcardNoLabelFullstring
        
    }
    
    func configureFlashcardExerciseLabel(){
        
        flashcardExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        flashcardExerciseLabel.topAnchor.constraint(equalTo: deckDetailsStackView.topAnchor, constant: 70).isActive = true
        flashcardExerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        flashcardExerciseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        flashcardExerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flashcardExerciseLabel.heightAnchor.constraint(equalToConstant: 250).isActive = true
        flashcardExerciseLabel.text = "Flashcard Front Text here"
        flashcardExerciseLabel.textColor = .white
        flashcardExerciseLabel.backgroundColor = .systemBlue
        flashcardExerciseLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        flashcardExerciseLabel.textAlignment = .center
        flashcardExerciseLabel.numberOfLines = 0
        flashcardExerciseLabel.adjustsFontSizeToFitWidth = true
        
    }

}
