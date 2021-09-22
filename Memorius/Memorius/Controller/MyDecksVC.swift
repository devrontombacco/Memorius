//
//  MyViewController.swift
//  Memorius
//
//  Created by Devron Tombacco on 30/08/2021.
//

import UIKit

class MyDecksVC: UIViewController {

    // MARK:-- Variables
    
    var testBiologyDeck = Deck(name: "Biology", flashcardArray:
        [
         Flashcard(question: "which organ pumps blood?", answer: "heart"),
         Flashcard(question: "which organ sees?", answer: "eyes"),
         Flashcard(question: "which organ digests?", answer: "stomach")
        ])

    var testGeographyDeck = Deck(name: "Geography", flashcardArray:
        [
         Flashcard(question: "what is the capital of Japan?", answer: "Tokyo"),
         Flashcard(question: "what is the capital of France?", answer: "Paris"),
         Flashcard(question: "what is the capital of Italy?", answer: "Rome")
        
        ])

    var testEnglishDeck = Deck(name: "English", flashcardArray:
        [
         Flashcard(question: "Name a famous English writer", answer: "Shakespeare"),
         Flashcard(question: "Name a boring text", answer: "poem"),
         Flashcard(question: "Name an action word", answer: "verb"),
        
        ])
    
    var testDeckNames = [String]()
    var testDeckArray = [Deck]()
    
//    var testDataArray: [Deck] = []
    var filteredData : [String] = []
    
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
        
        filteredData = testDeckNames
        
        addTestDecksToDataArray()
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
        navigationController?.pushViewController(nextVC, animated: true)
    }
    

    

}

// MARK:-- TABLEVIEW METHODS
extension MyDecksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckTableViewCell", for: indexPath)
        
        cell.textLabel?.text = testDataArray[indexPath.row].name
        
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        deckSearchBar.resignFirstResponder()
        deckSearchBar.text? = ""
    }
}
