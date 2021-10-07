//
//  MyViewController.swift
//  Memorius
//
//  Created by Devron Tombacco on 30/08/2021.
//

import UIKit
import RealmSwift

class MyDecksVC: UIViewController {

    // MARK:-- Variables
//    var filteredData : [String] = []
    
    var newFlashcard = Flashcard()
    
    let realm = try! Realm()
    var realmDataArray = try! Realm().objects(Flashcard.self).sorted(byKeyPath: "question", ascending: true)
    
    // MARK:-- UIElements
    let decksTableView = UITableView()
    let deckSearchBar = UISearchBar()
    
    // MARK:-- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(deckSearchBar)
        navigationItem.title = "My Decks"
        view.addSubview(decksTableView)
        decksTableView.delegate = self
        decksTableView.dataSource = self
        decksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DeckTableViewCell")
        configureTableView()
        configureSearchbar()
        deckSearchBar.delegate = self
        configureNavigationController()
//
//        filteredData = testDeckNames

        // Realm configuration
        let path = realm.configuration.fileURL?.path
        print("Path: \(String(describing: path))")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        decksTableView.reloadData()
        
    }
    
    //MARK:-- REALM CONFIG
    func addToRealm(toAdd: Flashcard){
        try! realm.write {
            realm.add(newFlashcard)
        }
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
    
    func configureNavigationController(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDeck))
    }

    @objc func addNewDeck(){
        print("Add new deck button clicked")
        let nextVC = CreateFlashcardsVC()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
    }

}

// MARK:-- TABLEVIEW METHODS
extension MyDecksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmDataArray.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckTableViewCell", for: indexPath)
        cell.textLabel?.text = realmDataArray[indexPath.row].question
        return cell
    }
    
    
}

extension MyDecksVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        decksTableView.deselectRow(at: indexPath, animated: true)
        let nextVC = DeckInfoVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK:-- SEARCHBAR METHODS
extension MyDecksVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // reset searchBar
//        filteredData = []
        
        // Make items appear in tableView if searchbar is empty
//         if searchText == "" {
//            print("searchbar empty")
//            let filteredDeckNames = testDeckNames.map {$0}
//            filteredData = filteredDeckNames
//
//        }
        
        // Match searchbar input to testDeckArray
//        for deck in testDeckNames {
//            if deck.uppercased().contains(searchText.uppercased()){
//                filteredData.append(deck)
//                print(filteredData)
//            }
//
//        }
        
        // reload tableView
        self.decksTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        deckSearchBar.resignFirstResponder()
        deckSearchBar.text? = ""
    }
}

extension MyDecksVC: CreateFlashcardsVCDelegate {
    
    func createCard(newlyCreatedFlashcard: Flashcard) {
        
        newFlashcard = newlyCreatedFlashcard
        addToRealm(toAdd: newFlashcard)
    }

}
