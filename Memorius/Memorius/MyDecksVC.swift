//
//  MyViewController.swift
//  Memorius
//
//  Created by Devron Tombacco on 30/08/2021.
//

import UIKit

class MyDecksVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.title = "Home"
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        view.addSubview(button)
        button.setTitle("push second controller", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked(){
        let secondController = SecondViewController()
        navigationController?.pushViewController(secondController, animated: true)
    }

}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "Second"
    }

}
