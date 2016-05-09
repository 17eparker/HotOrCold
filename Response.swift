//
//  Response.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/4/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import Foundation

class Response {
    var responseText = ""
    var tries = 0
    var oldGuess = 0
    var hasWon = false
    var level = "medium"
    var answer = 0
    
    func generateMediumResponse(guess: Int) -> God  {
        if tries == 0 {
            level = "medium"
            answer = generateAnswer()
        }
        tries += 1
        let diff = findDiff(answer, var2: guess)
        if self.tries == 1 {
            if diff != 0 {
                if diff == 1 {
                    responseText = "YOU ARE ON FIRE"
                } else if 2 <= diff && diff <= 5 {
                    responseText = "BURNING HOT"
                } else if 90 <= diff && diff <= 99 {
                    responseText = "You're so cold,you're are an ice cube"
                } else if 75 <= diff && diff <= 90 {
                    responseText = "Freezing cold"
                } else if 6 <= diff && diff <= 14 {
                    responseText = "Hot"
                } else if 15 <= diff && diff <= 32 {
                    responseText = "Warm"
                } else {
                    responseText = "Cold"
                }
            } else {
                responseText = "That's the answer! You win! That only took 1 try! Play Again?"
                hasWon = true
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 5 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 90 <= diff && diff <= 99 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 75 <= diff && diff <= 90 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 6 <= diff && diff <= 14 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                    }
                }
            } else {
                responseText = "That's the answer! You win! That took \(tries) tries. Play again?"
                hasWon = true
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries))
        if hasWon == true {
            totalReset()
        }
        return godObject
    }
    
    func generateEasyResponse(guess: Int) -> God  {
        if tries == 0 {
            level = "easy"
            answer = generateAnswer()
        }
        tries += 1
        let diff = findDiff(answer, var2: guess)
        if self.tries == 1 {
            if diff != 0 {
                if diff == 1 {
                    responseText = "YOU ARE ON FIRE"
                } else if 2 <= diff && diff <= 3 {
                    responseText = "BURNING HOT"
                } else if 45 <= diff && diff <= 50 {
                    responseText = "You're so cold,you're are an ice cube"
                } else if 35 <= diff && diff <= 44 {
                    responseText = "Freezing cold"
                } else if 4 <= diff && diff <= 9 {
                    responseText = "Hot"
                } else if 10 <= diff && diff <= 22 {
                    responseText = "Warm"
                } else {
                    responseText = "Cold"
                }
            } else {
                responseText = "That's the answer! You win! That only took 1 try! Play Again?"
                hasWon = true
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 3 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 45 <= diff && diff <= 50 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 35 <= diff && diff <= 44 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 4 <= diff && diff <= 9 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                    }
                }
            } else {
                responseText = "That's the answer! You win! That took \(tries) tries. Play again?"
                hasWon = true
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries))
        if hasWon == true {
            totalReset()
        }
        return godObject
    }
    
    
    func generateHardResponse(guess: Int) -> God  {
        if tries == 0 {
            level = "hard"
            answer = generateAnswer()
        }
        tries += 1
        let diff = findDiff(answer, var2: guess)
        if self.tries == 1 {
            if diff != 0 {
                if diff == 1 {
                    responseText = "YOU ARE ON FIRE"
                } else if 2 <= diff && diff <= 20 {
                    responseText = "BURNING HOT"
                } else if 900 <= diff && diff <= 1000 {
                    responseText = "You're so cold,you're are an ice cube"
                } else if 650 <= diff && diff <= 899 {
                    responseText = "Freezing cold"
                } else if 21 <= diff && diff <= 75 {
                    responseText = "Hot"
                } else if 76 <= diff && diff <= 150 {
                    responseText = "Warm"
                } else {
                    responseText = "Cold"
                }
            } else {
                responseText = "That's the answer! You win! That only took 1 try! Play Again?"
                hasWon = true
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 20 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 900 <= diff && diff <= 1000 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 650 <= diff && diff <= 899 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 21 <= diff && diff <= 75 {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                    }
                }
            } else {
                responseText = "That's the answer! You win! That took \(tries) tries. Play again?"
                hasWon = true
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries))
        if hasWon == true {
            totalReset()
        }
        return godObject
    }
    
    func findDiff(var1: Int, var2: Int) -> Int {
        let value = abs(var1 - var2)
        return value
    }
    
    func totalReset () {
        responseText = ""
        tries = 0
        oldGuess = 0
        answer = generateAnswer()
        hasWon = false
    }
    
    func generateAnswer () -> Int {
        var answer: Int?
        if level == "easy" {
            answer = Int(arc4random_uniform(UInt32(50)))
        } else if level == "hard" {
            answer = Int(arc4random_uniform(UInt32(1000)))
        } else {
            answer = Int(arc4random_uniform(UInt32(100)))
        }
        return answer!
    }
}
