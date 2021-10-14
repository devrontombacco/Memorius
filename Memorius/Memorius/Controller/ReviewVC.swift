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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Review"
        
        view.addSubview(frontLabel)
        
        configureFrontLabel()
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


}
