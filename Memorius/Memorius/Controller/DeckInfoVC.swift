//
//  DeckInfoVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 07/10/2021.
//

import UIKit
import RealmSwift

class DeckInfoVC: UIViewController {
    
    // MARK:-- Arrays
    var deckStatsArray = [UILabel]()
    
    // MARK:-- Realm Variables
    let realm = try! Realm()
    var myDecks = try! Realm().objects(Deck.self).sorted(byKeyPath: "name", ascending: true)
    
    // MARK:-- UIButton
    let startButton = UIButton()
    
    // MARK: -- UIImages
    let lastScoreImage = NSTextAttachment()
    let deckCreatedImage = NSTextAttachment()
    let highScoreImage = NSTextAttachment()
    let lastRunthroughImage = NSTextAttachment()
    let noOfFlashcardsImage = NSTextAttachment()
    
    // MARK:-- UILabels
    let deckDescriptionLabel      = UILabel()
    let lastScoreLabel            = UILabel()
    let deckCreatedLabel          = UILabel()
    let deckCategoryLabel         = UILabel()
    let highScoreLabel            = UILabel()
    let lastRunthroughLabel       = UILabel()
    let noOfFlashcardsLabel       = UILabel()
    
    // MARK:-- UITextviews
    var deckDescriptionTextView = UITextView()

    // MARK:-- UIStackviews
    let deckStatsStackView = UIStackView()
    
    // MARK: -- Variables
    var currentDeck: String = ""
    
    //MARK:-- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // VC setup
        view.backgroundColor = .white
        self.title = "\(currentDeck)"
        
        view.addSubview(deckDescriptionLabel)
        view.addSubview(deckDescriptionTextView)
        view.addSubview(deckStatsStackView)
        view.addSubview(startButton)
        
        configureBarButtonItem()
        configureDeckDescriptionLabel()
        configureDeckDescriptionTextView()
        configureDeckStatsStackView()
        configureDeckStatsStackViewLabels()
        configureStackViewLabelImages()
        configureStartButton()
        
        deckDescriptionTextView.delegate = self
        
        setUpCurrentDeckInfo()
    }
    
    // MARK:-- UI Configuration Methods
    private func configureBarButtonItem(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createFlashcard))
        
    }
    
    @objc func createFlashcard(){
        
        print("Create New Flashcard button tapped")
        let nextVC = CreateFlashcardsVC()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func setUpCurrentDeckInfo() {
        
        let decks = realm.objects(Deck.self)
        let runthroughDeck = decks.filter("name like '\(currentDeck)'")
        
        lastScoreLabel.text = "Last Score: \(runthroughDeck[0].lastScore)"
        deckCreatedLabel.text = "Date Created: \(runthroughDeck[0].createdDate)"
//        deckCategoryLabel.text = "Category: \(runthroughDeck[0].)"
        highScoreLabel.text = "High Score: \(runthroughDeck[0].highScore)"
        lastRunthroughLabel.text = "Last Run Through: \(runthroughDeck[0].lastRunthrough)"
        noOfFlashcardsLabel.text = "No. of Flashcards: \(runthroughDeck[0].flashcardArray.count)"
        deckDescriptionTextView.text = "\(runthroughDeck[0].deckDescription)"
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
        
        lastScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lastScoreLabel.backgroundColor = .white
        lastScoreLabel.textColor = .systemBlue
        lastScoreLabel.font = UIFont(name: "helvetica", size: 12)
        
        deckCreatedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckCreatedLabel.backgroundColor = .white
        deckCreatedLabel.textColor = .systemBlue
        deckCreatedLabel.font = UIFont(name: "helvetica", size: 12)
        
        deckCategoryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckCategoryLabel.backgroundColor = .white
        deckCategoryLabel.textColor = .systemBlue
        deckCategoryLabel.font = UIFont(name: "helvetica", size: 12)
        
        highScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        highScoreLabel.backgroundColor = .white
        highScoreLabel.textColor = .systemBlue
        highScoreLabel.font = UIFont(name: "helvetica", size: 12)
        
        lastRunthroughLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lastRunthroughLabel.backgroundColor = .white
        lastRunthroughLabel.textColor = .systemBlue
        lastRunthroughLabel.font = UIFont(name: "helvetica", size: 12)
        
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
    
    func configureStartButton(){
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.topAnchor.constraint(equalTo: deckStatsStackView.bottomAnchor, constant: 70).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 148).isActive = true
        startButton.setTitle("START", for: .normal)
        startButton.backgroundColor = .systemBlue
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        startButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
    
    @objc private func didTapStartButton() {
        let nextVC = RunthroughVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}

// MARK:-- UITextViewDelegate
extension DeckInfoVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        print("User has begun editing Deck Description TextField")
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            super.touchesBegan(touches, with: event)
        
        if let updatedDescription = deckDescriptionTextView.text {
            
            let decks = realm.objects(Deck.self)
            let runthroughDeck = decks.filter("name like '\(currentDeck)'")
                try! realm.write {
                    runthroughDeck[0].deckDescription = updatedDescription
                }
            deckDescriptionTextView.text = "\(runthroughDeck[0].deckDescription)"
        }
            print("User has ended editing textview")
    }
}

extension DeckInfoVC: CreateFlashcardsVCDelegate {

    func createCard(newlyCreatedFlashcard: Flashcard, addToDeck: Deck) {
        
        try! realm.write {
            realm.add(newlyCreatedFlashcard)
            addToDeck.flashcardArray.insert(newlyCreatedFlashcard, at: 0)
        }
        
    }
    
}
