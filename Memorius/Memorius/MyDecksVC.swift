//
//  HomeVC.swift
//  Memorius
//
//  Created by Devron Tombacco on 25/06/2021.
//

import UIKit

class MyDecksVC: UIViewController {

    let myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(myButton)
        configureButton()
    }
    
    func configureButton() {
        myButton.setTitle("Go", for: .normal)
        myButton.backgroundColor = .white
        myButton.setTitleColor(.black, for: .normal)
        myButton.frame = CGRect(x: 100, y: 400, width : 200, height: 52)
        myButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {

    }
    
}
