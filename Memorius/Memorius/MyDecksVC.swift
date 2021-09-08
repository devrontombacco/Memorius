//
//  MyViewController.swift
//  Memorius
//
//  Created by Devron Tombacco on 30/08/2021.
//

import UIKit

class MyDecksVC: UIViewController {

    // MARK:-- Variables
    var testDataArray = ["Deck 1", "Deck 2", "Deck 3", "Deck 4", "Deck 5", "Deck 6", "Deck 7", "Deck 8", "Deck 9"]
    var filteredData : [String]!
    
    // MARK:-- UIElements
    let decksTableView = UITableView()
    let deckSearchBar = UISearchBar()
    
    // MARK:-- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(deckSearchBar)
        navigationItem.title = "My Decks"
        view.addSubview(decksTableView)
        decksTableView.delegate = self
        decksTableView.dataSource = self
        decksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DeckTableViewCell")
        configureTableView()
        configureSearchbar()
        deckSearchBar.delegate = self
        filteredData = testDataArray
    }
    
    // MARK: UI Configuration Functions
    func configureSearchbar(){
        deckSearchBar.translatesAutoresizingMaskIntoConstraints = false
        deckSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        deckSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        deckSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        deckSearchBar.showsCancelButton = true
    }

    func configureTableView(){
        decksTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                decksTableView.topAnchor.constraint(equalTo: deckSearchBar.bottomAnchor),
                decksTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                decksTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                decksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    

}

// MARK:-- TABLEVIEW METHODS
extension MyDecksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckTableViewCell", for: indexPath)
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
}

extension MyDecksVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "", sender: nil)
    }
    
}

// MARK:-- SEARCHBAR METHODS
extension MyDecksVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        // Make items appear in tableView if searchbar is empty
        if searchText == "" {
            filteredData = testDataArray
        }
        
        // Match searchbar input to myDataArray
        for word in testDataArray {
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
        }
        
        // reload tableView
        self.decksTableView.reloadData()
    }
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "Second"
    }

}






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
