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
    var color = "0"
    // -3 is ice cube, -2 is freezing, -1 is cold, 0 is warm, 1 is hot, 2 is burning hot, 3 is on fire
    
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
                    responseText = "YOU ARE ON FIRE! Guess again"
                    color = "3"
                } else if 2 <= diff && diff <= 5 {
                    responseText = "BURNING HOT! Guess again"
                    color = "2"
                } else if 90 <= diff && diff <= 99 {
                    responseText = "You are as cold as can be. Guess again"
                    color = "-3"
                } else if 75 <= diff && diff <= 90 {
                    responseText = "Freezing cold. Guess again"
                    color = "-2"
                } else if 6 <= diff && diff <= 14 {
                    responseText = "Hot. Guess again"
                    color = "1"
                } else if 15 <= diff && diff <= 32 {
                    responseText = "Warm. Guess again"
                    color = "0"
                } else {
                    responseText = "Cold. Guess again"
                    color = "-1"
                }
            } else {
                responseText = "You guessed the answer in 1 try! Play Again?"
                color = "0"
                hasWon = true
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    color = "3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 5 {
                    color = "2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 90 <= diff && diff <= 99 {
                    color = "-3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 75 <= diff && diff <= 90 {
                    color = "-2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 6 <= diff && diff <= 14 {
                    color = "1"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                        color = "0"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                        color = "-1"
                    }
                }
            } else {
                responseText = "You guessed the answer in \(tries) tries! Play again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries), color: color)
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
                    responseText = "YOU ARE ON FIRE! Guess again"
                    color = "3"
                } else if 2 <= diff && diff <= 3 {
                    responseText = "BURNING HOT! Guess again"
                    color = "2"
                } else if 45 <= diff && diff <= 50 {
                    responseText = "You are as cold as can be. Guess again"
                    color = "-3"
                } else if 35 <= diff && diff <= 44 {
                    responseText = "Freezing cold. Guess again"
                    color = "-2"
                } else if 4 <= diff && diff <= 9 {
                    responseText = "Hot. Guess again"
                    color = "1"
                } else if 10 <= diff && diff <= 22 {
                    responseText = "Warm. Guess again"
                    color = "0"
                } else {
                    responseText = "Cold. Guess again"
                    color = "-1"
                }
            } else {
                responseText = "You guessed the answer in 1 try! Play Again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    color = "3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 3 {
                    color = "2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 45 <= diff && diff <= 50 {
                    color = "-3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 35 <= diff && diff <= 44 {
                    color = "-2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 4 <= diff && diff <= 9 {
                    color = "1"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                        color = "0"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                        color = "-1"
                    }
                }
            } else {
                responseText = "You guessed the answer in \(tries) tries! Play again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries), color: color)
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
                    responseText = "YOU ARE ON FIRE! Guess again"
                    color = "3"
                } else if 2 <= diff && diff <= 20 {
                    responseText = "BURNING HOT! Guess again"
                    color = "2"
                } else if 900 <= diff && diff <= 1000 {
                    responseText = "You are as cold as can be. Guess again"
                    color = "-3"
                } else if 650 <= diff && diff <= 899 {
                    responseText = "Freezing cold. Guess again"
                    color = "-2"
                } else if 21 <= diff && diff <= 75 {
                    responseText = "Hot. Guess again"
                    color = "1"
                } else if 76 <= diff && diff <= 150 {
                    responseText = "Warm. Guess again"
                    color = "0"
                } else {
                    responseText = "Cold. Guess again"
                    color = "-1"
                }
            } else {
                responseText = "You guessed the answer in 1 try! Play Again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    color = "3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 20 {
                    color = "2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 900 <= diff && diff <= 1000 {
                    color = "-3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 650 <= diff && diff <= 899 {
                    color = "-2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 21 <= diff && diff <= 75 {
                    color = "1"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                        color = "0"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                        color = "-1"
                    }
                }
            } else {
                responseText = "You guessed the answer in \(tries) tries! Play again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries), color: color)
        if hasWon == true {
            totalReset()
        }
        return godObject
    }
    
    func generateExtremeResponse(guess: Int) -> God  {
        if tries == 0 {
            level = "extreme"
            answer = generateAnswer()
        }
        tries += 1
        let diff = findDiff(answer, var2: guess)
        if self.tries == 1 {
            if diff != 0 {
                if diff == 1  {
                    responseText = "YOU ARE ON FIRE! Guess again"
                    color = "3"
                } else if 2 <= diff && diff <= 199 {
                    responseText = "BURNING HOT! Guess again"
                    color = "2"
                } else if 3500 <= diff && diff <= 5000 {
                    responseText = "You are as cold as can be. Guess again"
                    color = "-3"
                } else if 2000 <= diff && diff <= 3499 {
                    responseText = "Freezing cold. Guess again"
                    color = "-2"
                } else if 200 <= diff && diff <= 999 {
                    responseText = "Hot. Guess again"
                    color = "1"
                } else if 1000 <= diff && diff <= 1999 {
                    responseText = "Warm. Guess again"
                    color = "0"
                } else {
                    responseText = "Cold. Guess again"
                    color = "-1"
                }
            } else {
                responseText = "You guessed the answer in 1 try! Play Again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        } else {
            if diff != 0 {
                if diff == 1 {
                    color = "3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "YOU ARE ON FIRE, and getting warmer."
                    } else {
                        responseText = "YOU ARE ON FIRE, but getting colder"
                        // pic of fire //
                    }
                } else if 2 <= diff && diff <= 199 {
                    color = "2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "BURNING HOT, and getting warmer."
                    } else {
                        responseText = "BURNING HOT, but getting colder"
                    }
                } else if 3500 <= diff && diff <= 5000 {
                    color = "-3"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "You're so cold, you're an ice cube, but getting warmer"
                    } else {
                        responseText = "You're so cold, you're an ice cube, and getting colder"
                    }
                } else if 2000 <= diff && diff <= 3499 {
                    color = "-2"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Freezing cold, but getting warmer"
                    } else {
                        responseText = "Freezing cold, and getting colder"
                    }
                } else if 200 <= diff && diff <= 999 {
                    color = "1"
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Hot, and getting warmer"
                    } else {
                        responseText = "Hot, but getting colder"
                    }
                } else {
                    if diff < findDiff(answer, var2: oldGuess) {
                        responseText = "Warmer"
                        color = "0"
                    } else if diff > findDiff(answer, var2: oldGuess) {
                        responseText = "Colder"
                        color = "-1"
                    }
                }
            } else {
                responseText = "You guessed the answer in \(tries) tries! Play again?"
                hasWon = true
                color = "0"
            }
            oldGuess = guess
        }
        let godObject = God(response: responseText, win: hasWon, tryNumber: String(tries), color: color)
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
        color = "0"
    }
    
    func generateAnswer () -> Int {
        var answer: Int?
        if level == "easy" {
            answer = Int(arc4random_uniform(UInt32(50)))
        } else if level == "hard" {
            answer = Int(arc4random_uniform(UInt32(1000)))
        } else if level == "extreme" {
            answer = Int(arc4random_uniform(UInt32(5000)))
        } else {
            answer = Int(arc4random_uniform(UInt32(100)))
        }
        return answer!
    }
}
