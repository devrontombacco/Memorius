//
//  MemSectionHeading.swift
//  Memorius
//
//  Created by Devron Tombacco on 10/09/2021.
//

import Foundation
import UIKit
class MemSectionHeading: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String){
        super.init(frame: .zero)
        self.text = text
        configureLabel()
    }
    
    func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: 20, weight: .regular)
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .systemBlue
        self.backgroundColor = .white
        self.font = UIFont.systemFont(ofSize: 15)
    }
}
