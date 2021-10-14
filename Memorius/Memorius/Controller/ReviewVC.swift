//
//  ReviewVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 14/10/2021.
//

import UIKit

class ReviewVC: UIViewController {

    // MARK: UILABELS
    let frontLabel = UILabel()
    let backLabel = UILabel()
    
    // MARK:-- UIPROGRESSVIEWS
    let reviewProgressBar = UIProgressView(progressViewStyle: .bar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Review"
        view.backgroundColor = .white
        
        view.addSubview(frontLabel)
        view.addSubview(backLabel)
        view.addSubview(reviewProgressBar)
        
        configureFrontLabel()
        configureBackLabel()
        configureProgressBar()
    }
    
    func configureFrontLabel(){
        
        frontLabel.translatesAutoresizingMaskIntoConstraints = false
        frontLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        frontLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        frontLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        frontLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        frontLabel.heightAnchor.constraint(equalToConstant: 170).isActive = true
        frontLabel.text = " question text here"
        frontLabel.textColor = .white
        frontLabel.backgroundColor = .systemBlue
        frontLabel.font = UIFont(name: "helvetica", size: 14)
        frontLabel.textAlignment = .left
        frontLabel.numberOfLines = 0
        frontLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func configureBackLabel(){
        
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        backLabel.topAnchor.constraint(equalTo: frontLabel.bottomAnchor, constant: 20).isActive = true
        backLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        backLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backLabel.heightAnchor.constraint(equalToConstant: 170).isActive = true
        backLabel.text = " answer text here"
        backLabel.textColor = .white
        backLabel.backgroundColor = .systemBlue
        backLabel.font = UIFont(name: "helvetica", size: 14)
        backLabel.textAlignment = .left
        backLabel.numberOfLines = 0
        backLabel.adjustsFontSizeToFitWidth = true
        
    }

    func configureProgressBar(){
        
        reviewProgressBar.translatesAutoresizingMaskIntoConstraints = false
        reviewProgressBar.topAnchor.constraint(equalTo: backLabel.bottomAnchor, constant: 30).isActive = true
        reviewProgressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        reviewProgressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        reviewProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reviewProgressBar.frame = CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 50)
        reviewProgressBar.trackTintColor = .systemGray
        reviewProgressBar.progressTintColor = .systemBlue
        reviewProgressBar.setProgress(0.33, animated: false)
        
    }

}
