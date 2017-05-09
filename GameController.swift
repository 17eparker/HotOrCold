//
//  GameController.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/9/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import UIKit
import AVFoundation
import Social



class GameController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var lastGuessLabel: UILabel!
    
    @IBOutlet weak var lastGuessTextLabel: UILabel!
    @IBOutlet weak var triesLabel: UILabel!
    
    @IBOutlet weak var numTriesTextLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var facebookButton: UIButton!

    
    @IBOutlet weak var twitterButton: UIButton!

    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    let response = Response()
    var guess = 0
    var answer = 0
    var displayingEnter = true
    var incorrectPlayer: AVAudioPlayer!
    var winningPlayer: AVAudioPlayer!
    var error: NSError?
    var soundOn = true
    var level = "medium"
    var tryNumber = "0"
    var color = "0"
    var globalWin = false
    var expansionPack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if level == "easy" {
            responseLabel.text = "Guess a number between 0 and 50"
            levelLabel.text = "Easy"
            levelLabel.backgroundColor = UIColor(red: 59/255, green: 188/255, blue: 194/255, alpha:1)
            if BestScore.useBestScore("easy") == 0 {
                bestScoreLabel.text = "N/A"
            } else {
                bestScoreLabel.text = String(BestScore.useBestScore("easy"))
            }
        } else if level == "medium" {
            responseLabel.text = "Guess a number between 0 and 100"
            levelLabel.text = "Medium"
            levelLabel.backgroundColor = UIColor(red: 255/255, green: 159/255, blue: 77/255, alpha:1)
            if BestScore.useBestScore("medium") == 0 {
                bestScoreLabel.text = "N/A"
            } else {
                bestScoreLabel.text = String(BestScore.useBestScore("medium"))
            }
        } else if level == "hard" {
            responseLabel.text = "Guess a number between 0 and 1000"
            levelLabel.text = "Hard"
            levelLabel.backgroundColor = UIColor(red: 255/255, green: 86/255, blue: 77/255, alpha:1)
            if BestScore.useBestScore("hard") == 0 {
                bestScoreLabel.text = "N/A"
            } else {
                bestScoreLabel.text = String(BestScore.useBestScore("hard"))
            }
        } else {
            responseLabel.text = "Guess a number between 0 and 5000"
            levelLabel.text = "Extreme"
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var EnterPlayAgainButton: UIButton!
    @IBAction func enterClicked(_ sender: UIButton) {
        var godObject: God
        if displayingEnter == true {
            if level == "hard" {
                godObject = response.generateHardResponse(guess)
            } else if level == "easy" {
                godObject = response.generateEasyResponse(guess)
            } else if level == "medium" {
                godObject = response.generateMediumResponse(guess)
            } else {
                godObject = response.generateExtremeResponse(guess)
            }
            responseLabel.text = godObject.response
            triesLabel.text = godObject.tryNumber
            if godObject.color == "-3" {
                responseLabel.textColor = UIColor(red: 0, green: 96/255, blue: 100/255, alpha: 1)
            } else if godObject.color == "-2" {
                responseLabel.textColor = UIColor(red: 59/255, green: 188/255, blue: 194/255, alpha: 1)
            } else if godObject.color == "-1" {
                responseLabel.textColor = UIColor(red: 67/255, green: 221/255, blue: 86/255, alpha: 1)
            } else if godObject.color == "1" {
                responseLabel.textColor = UIColor(red: 255/255, green: 159/255, blue: 77/255, alpha: 1)
            } else if godObject.color == "2" {
                responseLabel.textColor = UIColor(red: 255/255, green: 86/255, blue: 77/255, alpha: 1)
            } else if godObject.color == "3" {
                responseLabel.textColor = UIColor(red: 165/255, green: 8/255, blue: 0, alpha: 1)
            } else {
                responseLabel.textColor = UIColor.black
            }
            if godObject.win == true {
                self.tryNumber = godObject.tryNumber
                if level == "easy" {
                    if BestScore.checkBestScore((Int(self.tryNumber))!, level: "easy") {
                        BestScore.setBestScoreEasy((Int(self.tryNumber))!)
                        bestScoreLabel.text = String(BestScore.useBestScore("easy"))
                    }
                } else if level == "medium" {
                    if BestScore.checkBestScore((Int(self.tryNumber))!, level: "medium") {
                        BestScore.setBestScoreMedium((Int(self.tryNumber))!)
                        bestScoreLabel.text = String(BestScore.useBestScore("medium"))
                    }
                } else if level == "hard" {
                    if BestScore.checkBestScore((Int(self.tryNumber))!, level: "hard") {
                        BestScore.setBestScoreHard((Int(self.tryNumber))!)
                        bestScoreLabel.text = String(BestScore.useBestScore("hard"))                    }
                } else {
                    if BestScore.checkBestScore((Int(self.tryNumber))!, level: "extreme") {BestScore.setBestScoreExtreme((Int(self.tryNumber))!)
                    }
                }
                lastGuessLabel.isHidden = true
                triesLabel.isHidden = true
                lastGuessTextLabel.isHidden = true
                numTriesTextLabel.isHidden = true
                deleteButton.isHidden = true
                inputLabel.isHidden = true
                twitterButton.isHidden = false
                facebookButton.isHidden = false
                if soundOn == true {
                    playWinningSound()
                }
                EnterPlayAgainButton.setTitle("Yes", for: UIControlState())
                displayingEnter = false
                color = "0"
                responseLabel.textColor = UIColor.black
                globalWin = true
            } else {
                if soundOn == true {
                    playIncorrectSound()
                }
            }
        } else {
            EnterPlayAgainButton.setTitle("Enter", for: UIControlState())
            displayingEnter = true
            triesLabel.text = "0"
            twitterButton.isHidden = true
            facebookButton.isHidden = true
            lastGuessLabel.isHidden = false
            triesLabel.isHidden = false
            lastGuessTextLabel.isHidden = false
            numTriesTextLabel.isHidden = false
            deleteButton.isHidden = false
            inputLabel.isHidden = false
            globalWin = false
            if level == "easy" {
                responseLabel.text = "Guess a number between 0 and 50"
                levelLabel.text = "Easy"
            } else if level == "medium" {
                responseLabel.text = "Guess a number between 0 and 100"
                levelLabel.text = "Medium"
            } else {
                responseLabel.text = "Guess a number between 0 and 1000"
                levelLabel.text = "Hard"
            }
        }
        reset()
    }
    
    @IBAction func oneButtonClicked(_ sender: UIButton) {
        if globalWin == false {
            if guess == 0 {
                inputLabel.text = sender.titleLabel!.text
                guess = Int(inputLabel.text!)! //need to change label before setting guess
            } else if guess > 0 && guess < 10 && level != "easy" {
                guess = guess * 10 + Int(sender.titleLabel!.text!)!
                inputLabel.text = String(guess)
            } else if guess < 5 && level == "easy" {
                guess = guess * 10 + Int(sender.titleLabel!.text!)!
                inputLabel.text = String(guess)
            } else if guess == 5 && Int(sender.titleLabel!.text!)! == 0 && level == "easy" {
                guess = 50
                inputLabel.text = String(guess)
            } else if guess == 10 && Int(sender.titleLabel!.text!)! == 0 && level == "medium" {
                guess = 100
                inputLabel.text = String(guess)
            } else if guess == 10 && Int(sender.titleLabel!.text!)! != 0 && level == "medium" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 100"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess > 10 && level == "medium" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 100"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess >= 10 && guess < 100 && level == "hard" {
                guess = guess * 10 + Int(sender.titleLabel!.text!)!
                inputLabel.text = String(guess)
            } else if guess == 100 && Int(sender.titleLabel!.text!)! == 0 && level == "hard" {
                guess = 1000
                inputLabel.text = String(guess)
            } else if guess > 100 && level == "hard" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 1000"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess == 5 && Int(sender.titleLabel!.text!)! != 0 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess > 5 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            }else if guess >= 10 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.black
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            } else {
                responseLabel.text = "This is a bug. pls tell App Developer!"
            }
        }
    }

    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
            inputLabel.text = "0"
            guess = 0
    }
    
    @IBAction func twitterButtonClicked(_ sender: AnyObject) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            if self.tryNumber == "1" {
            tweetShare.setInitialText("I just guessed the mystery number on my first try in the Hot or Cold app on the \(self.level) level! Think you can beat that?")
            } else {
                tweetShare.setInitialText("I just guessed the mystery number in only \(self.tryNumber) tries in the Hot or Cold app on the \(self.level) level! Think you can beat that?")
            }
            self.present(tweetShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func facebookButtonClicked(_ sender: AnyObject) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            self.present(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func playIncorrectSound(){
        if let path = Bundle.main.path(forResource: "negativeSound", ofType: "wav") {
            let fileURL: URL = URL(fileURLWithPath: path)
            do {
                try incorrectPlayer = AVAudioPlayer(contentsOf: fileURL)
            } catch {
                print("error getting incorrectSound to play")
            }
            incorrectPlayer.prepareToPlay()
            incorrectPlayer.delegate = self
            incorrectPlayer.play()
        }
    }
    
    
    func playWinningSound(){
        if let path = Bundle.main.path(forResource: "winningSound", ofType: "mp3") {
            let fileURL: URL = URL(fileURLWithPath: path)
            do {
                try winningPlayer = AVAudioPlayer(contentsOf: fileURL)
            } catch {
                print("error getting incorrectSound to play")
            }
            winningPlayer.prepareToPlay()
            winningPlayer.delegate = self
            winningPlayer.play()
        }
    }
    
    
    func reset() {
        lastGuessLabel.text = inputLabel.text
        guess = 0
        inputLabel.text = String(guess)
    }
}
