//
//  ScoreVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 13/10/2021.
//

import UIKit
import RealmSwift

class ScoreVC: UIViewController {
    
    // MARK:-- Realm Variables
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    // MARK:-- UILabels
    let scoreLabel = UILabel()
    let highScoreLabel = UILabel()
    let deckNameLabel = UILabel()
    let lastScoreLabel = UILabel()
    let runthroughsLabel = UILabel()
    
    // MARK: --UIImages
    let highScoreImage = NSTextAttachment()
    let deckNameImage = NSTextAttachment()
    let lastScoreImage = NSTextAttachment()
    let runthroughsImage = NSTextAttachment()
    
    // MARK:-- UIStackViews
    let runthroughStatsStackView = UIStackView()
    
    // MARK:-- VARIABLES
    var currentDeck: String = ""
    
    // MARK: -- UIButtons
    let repeatButton = UIButton()
    let reviewAnswersButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Score"
        view.backgroundColor = .white
        
        view.addSubview(scoreLabel)
        view.addSubview(runthroughStatsStackView)
        view.addSubview(repeatButton)
        view.addSubview(reviewAnswersButton)
        
        configureScoreLabel()
        configureRunthroughStatsStackView()
        configureStackViewLabels()
        configureRunthroughStackViewLabelImages()
        configureReviewAnswersButton()
        configureRepeatButton()
        setupScoreVCInfo()
    }
    
    func configureScoreLabel(){
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        scoreLabel.text = "3 / 10"
        scoreLabel.textColor = .systemBlue
        scoreLabel.backgroundColor = .white
        scoreLabel.font = UIFont.systemFont(ofSize: 80, weight: .light)
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 0
        scoreLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureStackViewLabels(){
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        highScoreLabel.textColor = .systemBlue
        highScoreLabel.backgroundColor = .white
        highScoreLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        highScoreLabel.textAlignment = .left
        
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deckNameLabel.textColor = .systemBlue
        deckNameLabel.backgroundColor = .white
        deckNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        deckNameLabel.textAlignment = .left
        
        lastScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        lastScoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lastScoreLabel.textColor = .systemBlue
        lastScoreLabel.backgroundColor = .white
        lastScoreLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        lastScoreLabel.textAlignment = .left
        
        runthroughsLabel.translatesAutoresizingMaskIntoConstraints = false
        runthroughsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        runthroughsLabel.textColor = .systemBlue
        runthroughsLabel.backgroundColor = .white
        runthroughsLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        runthroughsLabel.textAlignment = .left
        
    }
    
    func configureRunthroughStatsStackView() {
        
        runthroughStatsStackView.translatesAutoresizingMaskIntoConstraints = false
        runthroughStatsStackView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40).isActive = true
        runthroughStatsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        runthroughStatsStackView.addArrangedSubview(highScoreLabel)
        runthroughStatsStackView.addArrangedSubview(deckNameLabel)
        runthroughStatsStackView.addArrangedSubview(lastScoreLabel)
        runthroughStatsStackView.addArrangedSubview(runthroughsLabel)
        runthroughStatsStackView.backgroundColor = .systemGray
       
        runthroughStatsStackView.axis = .vertical
        runthroughStatsStackView.backgroundColor = .white
        runthroughStatsStackView.distribution = .fillEqually
        runthroughStatsStackView.spacing = 10
        runthroughStatsStackView.alignment = .center
        
    }
    
    func configureRunthroughStackViewLabelImages(){
        
        highScoreImage.image = UIImage(systemName: "chart.bar.fill")
        let lastScoreLabelFullstring = NSMutableAttributedString(string: " ")
        lastScoreLabelFullstring.append(NSAttributedString(attachment: highScoreImage))
        lastScoreLabelFullstring.append(NSAttributedString(string: "  High score: "))
        highScoreLabel.attributedText = lastScoreLabelFullstring
        
        lastScoreImage.image = UIImage(systemName: "folder.fill")
        let categoryImageFullstring = NSMutableAttributedString(string: " ")
        categoryImageFullstring.append(NSAttributedString(attachment: lastScoreImage))
        categoryImageFullstring.append(NSAttributedString(string: "  Last Score:"))
        lastScoreLabel.attributedText = categoryImageFullstring
        
        deckNameImage.image = UIImage(systemName: "calendar")
        let deckNameImageFullstring = NSMutableAttributedString(string: " ")
        deckNameImageFullstring.append(NSAttributedString(attachment: deckNameImage))
        deckNameImageFullstring.append(NSAttributedString(string: "  Deck Name: "))
        deckNameLabel.attributedText = deckNameImageFullstring
        
        runthroughsImage.image = UIImage(systemName: "clock.arrow.2.circlepath")
        let runthroughsImageFullstring = NSMutableAttributedString(string: " ")
        runthroughsImageFullstring.append(NSAttributedString(attachment: runthroughsImage))
        runthroughsImageFullstring.append(NSAttributedString(string: "  Total runthroughs:"))
        runthroughsLabel.attributedText = runthroughsImageFullstring
        
    }
    
    func configureReviewAnswersButton(){
        
        reviewAnswersButton.translatesAutoresizingMaskIntoConstraints = false
        reviewAnswersButton.topAnchor.constraint(equalTo: runthroughStatsStackView.bottomAnchor, constant: 60).isActive = true
        reviewAnswersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -20).isActive = true
        
        reviewAnswersButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        reviewAnswersButton.widthAnchor.constraint(equalToConstant: 148).isActive = true
        reviewAnswersButton.layer.cornerRadius = 10
        reviewAnswersButton.setTitle("REVIEW", for: .normal)
        reviewAnswersButton.backgroundColor = .systemBlue
        reviewAnswersButton.setTitleColor(.white, for: .normal)
        reviewAnswersButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        reviewAnswersButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        reviewAnswersButton.addTarget(self, action: #selector(didTapReviewAnswersButton), for: .touchUpInside)

    }
    
    @objc private func didTapReviewAnswersButton() {
        let reviewScreen = ReviewVC()
        reviewScreen.currentDeck = currentDeck
        navigationController?.pushViewController(reviewScreen, animated: true)
    }
    
    func configureRepeatButton() {
        
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.topAnchor.constraint(equalTo: runthroughStatsStackView.bottomAnchor, constant: 60).isActive = true
        repeatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 20).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 148).isActive = true
        repeatButton.layer.cornerRadius = 10
        repeatButton.setTitle("REPEAT", for: .normal)
        repeatButton.backgroundColor = .systemBlue
        repeatButton.setTitleColor(.white, for: .normal)
        repeatButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        repeatButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        repeatButton.addTarget(self, action: #selector(didTapRepeatButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapRepeatButton() {
        print("Repeat button tapped")
    }
    
    func setupScoreVCInfo() {
        
        let decks = realm.objects(Deck.self)
        let runthroughDeck = decks.filter("name like '\(currentDeck)'")
        
        scoreLabel.text = "\(runthroughDeck[0].lastScore) / \(runthroughDeck[0].flashcardArray.count)"
        highScoreLabel.text = "High Score: \(runthroughDeck[0].highScore)"
        deckNameLabel.text = "Deck: \(runthroughDeck[0].name)"
        lastScoreLabel.text = "Last Score: \(runthroughDeck[0].lastScore)"
        runthroughsLabel.text = "No. of runthroughs: \(runthroughDeck[0].noOfRunthroughs)"
    }
    
}
