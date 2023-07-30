//
//  CustomTableViewCell.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 08.07.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let scoreLabel = UILabel()
    private let scoreLabelX: CGFloat = 30
    
    static let identifier = "CustomTableViewCell"
    
    func presentScore(with scoreValue: String) {
        self.backgroundColor = .clear
        scoreLabel.text = scoreValue
        scoreLabel.textColor = .black
        scoreLabel.textAlignment = .left
        self.addSubview(scoreLabel)
        
        scoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: scoreLabelX).isActive = true
        scoreLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scoreLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
}
