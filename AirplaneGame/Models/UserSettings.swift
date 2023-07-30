//
//  UserSettings.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 10.07.2023.
//

import Foundation
import UIKit

private enum SettingsKeys: String {
    case userName
    case airplaneType
    case gameSpeed
}

class UserSettings {
    
    static var userName: String {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)!
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = Optional(newValue) {
                print("value \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var airplaneType: String {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.airplaneType.rawValue)!
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.airplaneType.rawValue
            if let type = Optional(newValue) {
                print("value \(type) was added to key \(key)")
                defaults.set(type, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var gameSpeed: Double {
        get {
            return UserDefaults.standard.double(forKey: SettingsKeys.gameSpeed.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.gameSpeed.rawValue
            if let speed = Optional(newValue) {
                print("value \(speed) was added to key \(key)")
                defaults.set(speed, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
