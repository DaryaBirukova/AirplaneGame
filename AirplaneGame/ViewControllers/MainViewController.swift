//
//  MainViewController.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 06.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let backView = UIImageView()
    private let backImage = UIImage(named: "background.jpeg")
    private let playButton = UIButton()
    private let scoreButton = UIButton()
    private let settingsButton = UIButton()
    private let buttonWidth = CGFloat(120)
    private let buttonHeight =  CGFloat(40)
    private let areaBetweenButtons = CGFloat(30)
    private let leadingConstraint = CGFloat(120)
    private let topConstraint = CGFloat(280)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonsAndBackView()
    }
    
    @objc func playButtonPressed(sender: UITapGestureRecognizer) {
        let vc = PlayViewController()
        self.present(vc, animated: true)
    }
    
    @objc func scoreButtonPressed(sender: UITapGestureRecognizer) {
        let vc = ScoreViewController()
        self.present(vc, animated: true)
    }
    
    @objc func settingsButtonPressed(sender: UITapGestureRecognizer) {
        let vc = SettingsViewController()
        self.present(vc, animated: true)
    }
    
    func addButtonsAndBackView() {
        
        // MARK: - Add back view
        
        backView.frame = CGRect(x: view.frame.minX,
                                y: view.frame.minY,
                                width: view.frame.maxX,
                                height: view.frame.maxY
        )
        backView.backgroundColor = .clear
        backView.contentMode = UIView.ContentMode.scaleAspectFill
        backView.image = backImage
        self.view.addSubview(backView)
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        // MARK: - Add play button
        
        playButton.frame = CGRect(x: view.frame.midX - buttonWidth / 2,
                                  y: view.frame.midY - areaBetweenButtons,
                                  width: buttonWidth,
                                  height: buttonHeight
        )
        playButton.backgroundColor = .red
        playButton.setTitle("PLAY", for: .normal)
        playButton.layer.cornerRadius = 7
        playButton.addTarget(self, action: #selector(playButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(playButton)
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -(1.7 * areaBetweenButtons)).isActive = true
        
        // MARK: - Add score button
        
        scoreButton.frame = CGRect(x: view.frame.midX - buttonWidth / 2,
                                   y: view.frame.midY,
                                   width: buttonWidth,
                                   height: buttonHeight)
        scoreButton.backgroundColor = .red
        scoreButton.setTitle("Score", for: .normal)
        scoreButton.layer.cornerRadius = 7
        scoreButton.addTarget(self, action: #selector(scoreButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(scoreButton)
        
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        scoreButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive =  true
        scoreButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        scoreButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: - Add settings button
        
        settingsButton.frame = CGRect(x: view.frame.midX - buttonWidth / 2,
                                      y: view.frame.midY + areaBetweenButtons,
                                      width: buttonWidth,
                                      height: buttonHeight)
        settingsButton.backgroundColor = .red
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.layer.cornerRadius = 7
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(settingsButton)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.topAnchor.constraint(equalTo: scoreButton.bottomAnchor, constant: areaBetweenButtons).isActive = true
    }
}
