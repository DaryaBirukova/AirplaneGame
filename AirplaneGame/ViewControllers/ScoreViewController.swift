//
//  ScoreViewController.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 08.07.2023.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var array = TimerModel.score.getScore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    func createTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: view.frame.minX,
                                 y: view.frame.minY,
                                 width: view.frame.maxX,
                                 height: view.frame.maxY
        )
        tableView.backgroundColor = .systemGray3
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
