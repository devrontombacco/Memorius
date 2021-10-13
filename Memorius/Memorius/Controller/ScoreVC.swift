//
//  ScoreVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 13/10/2021.
//

import UIKit

class ScoreVC: UIViewController {

    let scoreLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Score"
        view.backgroundColor = .white
        
        view.addSubview(scoreLabel)
        configureScoreLabel()
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
    


}
