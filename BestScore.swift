//
//  BestScore.swift
//  HotOrCold
//
//  Created by Liz Parker on 9/1/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import Foundation
import UIKit

class BestScore {
    
    static func setBestScoreEasy(_ newBestScoreEasy: Int) {
        let defaults = UserDefaults.standard
        defaults.set(newBestScoreEasy, forKey: "bestScoreKeyEasy")
    }
    
    static func setBestScoreMedium(_ newBestScoreMedium: Int) {
        let defaults = UserDefaults.standard
        defaults.set(newBestScoreMedium, forKey: "bestScoreKeyMedium")
    }
    
    static func setBestScoreHard(_ newBestScoreHard: Int) {
        let defaults = UserDefaults.standard
        defaults.set(newBestScoreHard, forKey: "bestScoreKeyHard")
    }
    
    static func setBestScoreExtreme(_ newBestScoreExtreme: Int) {
        let defaults = UserDefaults.standard
        defaults.set(newBestScoreExtreme, forKey: "bestScoreKeyExtreme")
    }
    
    static func useBestScore(_ level: String) -> Int {
        let defaults = UserDefaults.standard
        if level == "easy" {
            let currentBestScoreEasy = defaults.object(forKey: "bestScoreKeyEasy")
            if currentBestScoreEasy == nil {
                return 0
            } else {
                let theInt = defaults.integer(forKey: "bestScoreKeyEasy")
                return theInt
            }
        } else if level == "medium" {
            let currentBestScoreMedium = defaults.object(forKey: "bestScoreKeyMedium")
            if currentBestScoreMedium == nil {
                return 0
            } else {
                let theInt = defaults.integer(forKey: "bestScoreKeyMedium")
                return theInt
            }
        } else if level == "hard" {
            let currentBestScoreHard = defaults.object(forKey: "bestScoreKeyHard")
            if currentBestScoreHard == nil {
                return 0
            } else {
                let theInt = defaults.integer(forKey: "bestScoreKeyHard")
                return theInt
            }
        } else {
            let currentBestScoreExtreme = defaults.integer(forKey: "bestScoreKeyExtreme")
            return currentBestScoreExtreme
        }
    }
    
    static func checkBestScore(_ tries: Int, level: String) -> Bool {
        var newScore = false
        if level == "easy" {
            if useBestScore("easy") == 0 {
                newScore = true // no score has been set yet so newScore must be true
            } else if tries >= useBestScore("easy") {
                newScore = false
            } else {
                newScore = true
            }
        } else if level == "medium" {
            if useBestScore("medium") == 0 {
                newScore = true // no score has been set yet so newScore must be true
            } else if tries >= useBestScore("medium") {
                newScore = false
            } else {
                newScore = true
            }
        } else if level == "hard" {
            if useBestScore("hard") == 0 {
                newScore = true // no score has been set yet so newScore must be true
            } else if tries >= useBestScore("hard") {
                newScore = false
            } else {
                newScore = true
            }
        } else {
            if useBestScore("extreme") == 0 {
                newScore = true // no score has been set yet so newScore must be true
            } else if tries >= useBestScore("extreme") {
                newScore = false
            } else {
                newScore = true
            }
        }
        return newScore
    }
    
    
}
