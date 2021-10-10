//
//  DeckInfoVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 07/10/2021.
//

import UIKit

class DeckInfoVC: UIViewController {

    // MARK:-- UILABELS
    let deckDescriptionLabel      = UILabel()
    let lastScoreLabel            = UILabel()
    let deckCreatedLabel          = UILabel()
    let deckCategoryLabel         = UILabel()
    let highScoreLabel            = UILabel()
    let lastRunthroughLabel       = UILabel()
    let noOfFlashcardsLabel       = UILabel()
    
    // MARK:-- UITEXTVIEWS
    var deckDescriptionTextView = UITextView()
    
    
    // MARK: -- UIIMAGES
    let lastScoreImage = NSTextAttachment()
    let deckCreatedImage = NSTextAttachment()
    let highScoreImage = NSTextAttachment()
    let lastRunthroughImage = NSTextAttachment()
    let noOfFlashcardsImage = NSTextAttachment()
    
    // MARK:-- ARRAYS
    var deckStatsArray = [UILabel]()
    
    // MARK:-- UISTACKVIEWS
    let deckStatsStackView = UIStackView()
    
    //MARK:-- VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Deck Title here"
        
        view.addSubview(deckDescriptionLabel)
        view.addSubview(deckDescriptionTextView)
        view.addSubview(deckStatsStackView)
        
        configureDeckDescriptionLabel()
        configureDeckDescriptionTextView()
        configureDeckStatsStackView()
        configureDeckStatsStackViewLabels()
        configureStackViewLabelImages()
        
        deckDescriptionTextView.delegate = self
            
        view.backgroundColor = .white
    }
    
    // MARK:-- UI CONFIGURATION METHODS
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
    
    func configureDeckStatsStackView(){
        
        deckStatsStackView.translatesAutoresizingMaskIntoConstraints = false
        deckStatsStackView.topAnchor.constraint(equalTo: deckDescriptionTextView.bottomAnchor, constant: 70).isActive = true
        deckStatsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deckStatsStackView.addArrangedSubview(lastScoreLabel)
        deckStatsStackView.addArrangedSubview(deckCreatedLabel)
        deckStatsStackView.addArrangedSubview(highScoreLabel)
        deckStatsStackView.addArrangedSubview(lastRunthroughLabel)
        deckStatsStackView.addArrangedSubview(noOfFlashcardsLabel)
        deckStatsStackView.axis = .vertical
        deckStatsStackView.backgroundColor = .white
        deckStatsStackView.distribution = .fillEqually
        deckStatsStackView.spacing = 10
        deckStatsStackView.alignment = .leading
        
    }
    
    func configureDeckStatsStackViewLabels(){
        
        lastScoreLabel.text = "Last Score: "
        lastScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lastScoreLabel.backgroundColor = .white
        lastScoreLabel.textColor = .systemBlue
        lastScoreLabel.font = UIFont(name: "helvetica", size: 12)
        
        deckCreatedLabel.text = "Date Created: "
        deckCreatedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckCreatedLabel.backgroundColor = .white
        deckCreatedLabel.textColor = .systemBlue
        deckCreatedLabel.font = UIFont(name: "helvetica", size: 12)
        
        deckCategoryLabel.text = "Category: "
        deckCategoryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckCategoryLabel.backgroundColor = .white
        deckCategoryLabel.textColor = .systemBlue
        deckCategoryLabel.font = UIFont(name: "helvetica", size: 12)
        
        highScoreLabel.text = "High Score: "
        highScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        highScoreLabel.backgroundColor = .white
        highScoreLabel.textColor = .systemBlue
        highScoreLabel.font = UIFont(name: "helvetica", size: 12)
        
        lastRunthroughLabel.text = "Last Run Through: "
        lastRunthroughLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lastRunthroughLabel.backgroundColor = .white
        lastRunthroughLabel.textColor = .systemBlue
        lastRunthroughLabel.font = UIFont(name: "helvetica", size: 12)
        
        noOfFlashcardsLabel.text = "No. of Flashcards: "
        noOfFlashcardsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        noOfFlashcardsLabel.backgroundColor = .white
        noOfFlashcardsLabel.textColor = .systemBlue
        noOfFlashcardsLabel.font = UIFont(name: "helvetica", size: 12)
    
    }
    
    func configureStackViewLabelImages(){
        
        lastScoreImage.image = UIImage(systemName: "chart.bar.fill")
        let lastScoreLabelFullstring = NSMutableAttributedString(string: " ")
        lastScoreLabelFullstring.append(NSAttributedString(attachment: lastScoreImage))
        lastScoreLabelFullstring.append(NSAttributedString(string: "  Last score: "))
        lastScoreLabel.attributedText = lastScoreLabelFullstring
        
        deckCreatedImage.image = UIImage(systemName: "calendar")
        let deckCreatedImageFullstring = NSMutableAttributedString(string: " ")
        deckCreatedImageFullstring.append(NSAttributedString(attachment: deckCreatedImage))
        deckCreatedImageFullstring.append(NSAttributedString(string: "  Deck created: "))
        deckCreatedLabel.attributedText = deckCreatedImageFullstring
        
        highScoreImage.image = UIImage(systemName: "folder.fill")
        let highScoreImageFullstring = NSMutableAttributedString(string: " ")
        highScoreImageFullstring.append(NSAttributedString(attachment: highScoreImage))
        highScoreImageFullstring.append(NSAttributedString(string: "  High score:"))
        highScoreLabel.attributedText = highScoreImageFullstring
        
        lastRunthroughImage.image = UIImage(systemName: "clock.arrow.2.circlepath")
        let lastRunthroughImageFullstring = NSMutableAttributedString(string: " ")
        lastRunthroughImageFullstring.append(NSAttributedString(attachment: lastRunthroughImage))
        lastRunthroughImageFullstring.append(NSAttributedString(string: "  Last run through:"))
        lastRunthroughLabel.attributedText = lastRunthroughImageFullstring
        
        noOfFlashcardsImage.image = UIImage(systemName: "number")
        let noOfFlashcardsImageFullstring = NSMutableAttributedString(string: " ")
        noOfFlashcardsImageFullstring.append(NSAttributedString(attachment: noOfFlashcardsImage))
        noOfFlashcardsImageFullstring.append(NSAttributedString(string: "  No. of flashcards: "))
        noOfFlashcardsLabel.attributedText = noOfFlashcardsImageFullstring
        
    }
    

}

// MARK:-- UITEXTVIEWDELEGATE
extension DeckInfoVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        print("User has begun editing Deck Description TextField")
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}
