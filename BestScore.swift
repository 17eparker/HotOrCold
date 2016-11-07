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
    
    static func setBestScoreEasy(newBestScoreEasy: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newBestScoreEasy, forKey: "bestScoreKeyEasy")
    }
    
    static func setBestScoreMedium(newBestScoreMedium: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newBestScoreMedium, forKey: "bestScoreKeyMedium")
    }
    
    static func setBestScoreHard(newBestScoreHard: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newBestScoreHard, forKey: "bestScoreKeyHard")
    }
    
    static func setBestScoreExtreme(newBestScoreExtreme: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newBestScoreExtreme, forKey: "bestScoreKeyExtreme")
    }
    
    static func useBestScore(level: String) -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        if level == "easy" {
            let currentBestScoreEasy = defaults.objectForKey("bestScoreKeyEasy")
            if currentBestScoreEasy == nil {
                return 0
            } else {
                let theInt = defaults.integerForKey("bestScoreKeyEasy")
                return theInt
            }
        } else if level == "medium" {
            let currentBestScoreMedium = defaults.objectForKey("bestScoreKeyMedium")
            if currentBestScoreMedium == nil {
                return 0
            } else {
                let theInt = defaults.integerForKey("bestScoreKeyMedium")
                return theInt
            }
        } else if level == "hard" {
            let currentBestScoreHard = defaults.objectForKey("bestScoreKeyHard")
            if currentBestScoreHard == nil {
                return 0
            } else {
                let theInt = defaults.integerForKey("bestScoreKeyHard")
                return theInt
            }
        } else {
            let currentBestScoreExtreme = defaults.integerForKey("bestScoreKeyExtreme")
            return currentBestScoreExtreme
        }
    }
    
    static func checkBestScore(tries: Int, level: String) -> Bool {
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
