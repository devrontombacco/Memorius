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
    var filteredData : [String] = []
    var deckNamesArray : [String] = []
    var newFlashcard = Flashcard()
    var newDeck = Deck(name: "")
    
    // MARK:-- Realm Variables
    let realm = try! Realm()
    var flashcardDataArray = try! Realm().objects(Flashcard.self).sorted(byKeyPath: "question", ascending: true)
    var deckDataArray = try! Realm().objects(Deck.self).sorted(byKeyPath: "name", ascending: true)
    
    // MARK:-- UISearchBar
    let deckSearchBar = UISearchBar()
    
    //MARK:-- UITableView
    let decksTableView = UITableView()
    
    // MARK:-- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // VC setup
        navigationItem.title = "My Decks"
        view.backgroundColor = .white
        view.addSubview(deckSearchBar)
        view.addSubview(decksTableView)
        configureBarButtonItem()
        
        // tableView setup
        decksTableView.delegate = self
        decksTableView.dataSource = self
        decksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DeckTableViewCell")
        
        // UI setup
        configureTableView()
        configureSearchbar()
  
        // Realm configuration
        let path = realm.configuration.fileURL?.path
        print("Path: \(String(describing: path))")
        
        
        // Searchbar filter
        deckSearchBar.delegate = self
        createDeckNamesArray()
        filteredData = deckNamesArray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        decksTableView.reloadData()
    }
    
    // MARK: UI Configuration Functions
    func configureSearchbar(){
        
        deckSearchBar.translatesAutoresizingMaskIntoConstraints = false
        deckSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        deckSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        deckSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        deckSearchBar.showsCancelButton = false
        
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
    
    private func configureBarButtonItem(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDeck))
        
    }

    @objc func addNewDeck(){
        
        print("Add new deck button tapped")
        let nextVC = CreateDecksVC()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func createDeckNamesArray(){
        
        try! realm.write {
            for deck in deckDataArray {
                deckNamesArray.append(deck.name)
            }
        }
        
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
        
        decksTableView.deselectRow(at: indexPath, animated: true)
        let nextVC = DeckInfoVC()
        nextVC.currentDeck = filteredData[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK:-- SEARCHBAR METHODS
extension MyDecksVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // reset searchBar
        filteredData = []
        
        // Make items appear in tableView if searchbar is empty
         if searchText == "" {
            
            print("searchbar empty")
            let filteredDeckNames = deckNamesArray.map {$0}
            filteredData = filteredDeckNames
            
        }
        
        // Match searchbar input to deckDataArray
        for deck in deckNamesArray {
            
            if deck.uppercased().contains(searchText.uppercased()){
                filteredData.append(deck)
                print(filteredData)
            }
            
        }
        
        // reload tableView
        self.decksTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        deckSearchBar.resignFirstResponder()
        deckSearchBar.text? = ""
        
    }
    
}

extension MyDecksVC: CreateDecksVCDelegate {
    
    func createDeck(newlyCreatedDeck: Deck) {
        
        deckNamesArray = []
        try! realm.write {
            realm.add(newlyCreatedDeck)
        }
        
        try! realm.write {
            for deck in deckDataArray {
                deckNamesArray.append(deck.name)
            }
        }
        
        filteredData = deckNamesArray
        print("Added \(newlyCreatedDeck.name) Deck to Realm")
    }
}
