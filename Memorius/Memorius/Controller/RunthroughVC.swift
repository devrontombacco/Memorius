//
//  RunthroughVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 10/10/2021.
//

import UIKit
import RealmSwift

class RunthroughVC: UIViewController {

    // MARK:-- Realm Variables
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    // MARK:-- UILabels
    let deckRunthroughNoLabel = UILabel()
    let deckFlashcardNoLabel = UILabel()
    let flashcardExerciseLabel = UILabel()
    
    // MARK:-- UIStackViews
    let deckDetailsStackView = UIStackView()

    // MARK:-- UIImages
    let runthroughImage = NSTextAttachment()
    let flashcardNoImage = NSTextAttachment()
    
    // MARK:-- UIProgressViews
    let runthroughProgressView = UIProgressView(progressViewStyle: .bar)
    
    // MARK:-- UIButtons
    let flipButton = UIButton()
    let wrongButton = UIButton()
    let rightButton = UIButton()
    
    // MARK:-- VARIABLES
    var runthroughNo: Int = 0
    var deckFlashcardNo: Int = 0
    var currentDeck: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Runthrough: (Deck Name Here)"
        
        view.addSubview(deckDetailsStackView)
        view.addSubview(deckRunthroughNoLabel)
        view.addSubview(deckFlashcardNoLabel)
        view.addSubview(flashcardExerciseLabel)
        view.addSubview(runthroughProgressView)
        view.addSubview(flipButton)
        view.addSubview(wrongButton)
        view.addSubview(rightButton)
        
        configureDeckLabels()
        configureDeckDetailsStackView()
        configuredeckDetailsStackViewLabelImages()
        configureFlashcardExerciseLabel()
        configureRunthroughProgressView()
        configureFlipButton()
        configureWrongButton()
        configureRightButton()
        setUpCurrentDeckInfo()
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
        deckRunthroughNoLabelFullstring.append(NSAttributedString(string: "  Runthroughs: \(runthroughNo)"))
        deckRunthroughNoLabel.attributedText = deckRunthroughNoLabelFullstring
        
        flashcardNoImage.image = UIImage(systemName: "number")
        let deckFlashcardNoLabelFullstring = NSMutableAttributedString(string: " ")
        deckFlashcardNoLabelFullstring.append(NSAttributedString(attachment: flashcardNoImage))
        deckFlashcardNoLabelFullstring.append(NSAttributedString(string: "  No. Flashcards: \(deckFlashcardNo)"))
        deckFlashcardNoLabel.attributedText = deckFlashcardNoLabelFullstring
        
    }
    
    func setUpCurrentDeckInfo() {
        
        let decks = realm.objects(Deck.self)
        let runthroughDeck = decks.filter("name like '\(currentDeck)'")
        self.title = "Last Score: \(runthroughDeck[0].name)"
        runthroughNo = runthroughDeck[0].noOfRunthroughs
        deckFlashcardNo = runthroughDeck[0].flashcardArray.count

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
    
    func configureRunthroughProgressView() {
        
        runthroughProgressView.translatesAutoresizingMaskIntoConstraints = false
        runthroughProgressView.topAnchor.constraint(equalTo: flashcardExerciseLabel.bottomAnchor, constant: 30).isActive = true
        runthroughProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        runthroughProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        runthroughProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        runthroughProgressView.frame = CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 50)
        runthroughProgressView.trackTintColor = .systemGray
        runthroughProgressView.progressTintColor = .systemBlue
        runthroughProgressView.setProgress(0.33, animated: false)
    }
    
    func configureFlipButton() {
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        flipButton.topAnchor.constraint(equalTo: runthroughProgressView.bottomAnchor, constant: 70).isActive = true
        flipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flipButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        flipButton.widthAnchor.constraint(equalToConstant: 148).isActive = true
        flipButton.setTitle("FLIP", for: .normal)
        flipButton.backgroundColor = .systemBlue
        flipButton.setTitleColor(.white, for: .normal)
        flipButton.layer.cornerRadius = 10
        flipButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        flipButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flipButton.addTarget(self, action: #selector(didTapFlipButton), for: .touchUpInside)
    }
    
    @objc private func didTapFlipButton() {
        print("FLIP button tapped")
        let nextVC = ScoreVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func configureWrongButton(){
        
        wrongButton.translatesAutoresizingMaskIntoConstraints = false
        wrongButton.topAnchor.constraint(equalTo: runthroughProgressView.bottomAnchor, constant: 70).isActive = true
        wrongButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        wrongButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        wrongButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        wrongButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        wrongButton.tintColor = .white
        wrongButton.backgroundColor = .systemBlue
        wrongButton.setTitleColor(.white, for: .normal)
        wrongButton.layer.cornerRadius = 24
        wrongButton.addTarget(self, action: #selector(didTapWrongButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapWrongButton(){
        print("WRONG button tapped")
    }
    
    func configureRightButton(){
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.topAnchor.constraint(equalTo: runthroughProgressView.bottomAnchor, constant: 70).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        rightButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        rightButton.tintColor = .white
        rightButton.backgroundColor = .systemBlue
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.layer.cornerRadius = 24
        rightButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapRightButton(){
        print("RIGHT button tapped")
    }
    
}
