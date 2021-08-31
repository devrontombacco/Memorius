//
//  MyViewController.swift
//  Memorius
//
//  Created by Devron Tombacco on 30/08/2021.
//

import UIKit

class MyDecksVC: UIViewController {

    let decksTableView = UITableView()
    var testDataArray = ["Deck 1", "Deck 2", "Deck 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.title = "My Decks"
        view.addSubview(decksTableView)
        decksTableView.dataSource = self
        decksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DeckTableViewCell")
        configureTableView()
    }
    
    func configureTableView(){
        decksTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                decksTableView.topAnchor.constraint(equalTo: view.topAnchor),
                decksTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                decksTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                decksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
}

extension MyDecksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckTableViewCell", for: indexPath)
        
        cell.textLabel?.text = testDataArray[indexPath.row]
        
        return cell
    }
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "Second"
    }

}



//        decksTableView.delegate = self


//    func configureButton(){
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
//        view.addSubview(button)
//        button.setTitle("push second controller", for: .normal)
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//    }
//
//    @objc func buttonClicked(){
//        let secondController = SecondViewController()
//        navigationController?.pushViewController(secondController, animated: true)
//    }
