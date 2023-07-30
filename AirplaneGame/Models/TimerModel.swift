//
//  ScoreModel.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 10.07.2023.
//

import Foundation

class TimerModel {
    var timer: Timer? = Timer()
    let updateInterval = 1.0
    var currentScore = 0
    var scoreArray: [Int] = []
    let scoreKey = "score"
    let defaults = UserDefaults.standard
    
    static let score = TimerModel()
    
    func startGameTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { timer in
            self.currentScore += 1
        }
    }
    
    func stopGameTimer() {
        timer?.invalidate()
        timer = nil
        scoreArray.append(currentScore)
        currentScore = 0
        self.addScore(currentScore: currentScore)
        self.startGameTimer()
    }
    
    func addScore(currentScore: Int) {
        guard var scoreArray = UserDefaults.standard.value(forKey: scoreKey) as? [Int] else {
            let scoreArray = [currentScore]
            UserDefaults.standard.set(currentScore, forKey: scoreKey)
            return
        }
        scoreArray.append(currentScore)
        UserDefaults.standard.set(currentScore, forKey: scoreKey)
    }
    
    var getScore: [Int] {
        guard let scoreArray = UserDefaults.standard.value(forKey: scoreKey) as? [Int] else {
            return []
        }
        return scoreArray
    }
}
