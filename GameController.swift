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
    
    @IBOutlet weak var triesLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var twitterButton: UIButton!
    
    @IBOutlet weak var facebookButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var EnterPlayAgainButton: UIButton!
    @IBAction func enterClicked(sender: UIButton) {
        var godObject: God
        if displayingEnter == true {
            if level == "hard" {
                godObject = response.generateHardResponse(guess)
            } else if level == "easy" {
                godObject = response.generateEasyResponse(guess)
            } else {
                godObject = response.generateMediumResponse(guess)
            }
            responseLabel.text = godObject.response
            triesLabel.text = godObject.tryNumber
            if godObject.color == "-3" {
                responseLabel.textColor = UIColor.blueColor()
            } else if godObject.color == "-2" {
                responseLabel.textColor = UIColor.cyanColor()
            } else if godObject.color == "-1" {
                responseLabel.textColor = UIColor.greenColor()
            } else if godObject.color == "1" {
                responseLabel.textColor = UIColor.orangeColor()
            } else if godObject.color == "2" {
                responseLabel.textColor = UIColor.magentaColor()
            } else if godObject.color == "3" {
                responseLabel.textColor = UIColor.redColor()
            } else {
                responseLabel.textColor = UIColor.blackColor()
            }
            if godObject.win == true {
                self.tryNumber = godObject.tryNumber
                twitterButton.hidden = false
                facebookButton.hidden = false
                if soundOn == true {
                    playWinningSound()
                }
                EnterPlayAgainButton.setTitle("Yes", forState: .Normal)
                displayingEnter = false
                color = "0"
                responseLabel.textColor = UIColor.blackColor()
                globalWin = true
            } else {
                if soundOn == true {
                    playIncorrectSound()
                }
            }
        } else {
            EnterPlayAgainButton.setTitle("Enter", forState: .Normal)
            displayingEnter = true
            triesLabel.text = "0"
            twitterButton.hidden = true
            facebookButton.hidden = true
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
    
    @IBAction func oneButtonClicked(sender: UIButton) {
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
                responseLabel.textColor = UIColor.blackColor()
                responseLabel.text = "You may only guess a number between 0 and 100"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess > 10 && level == "medium" {
                color = "0"
                responseLabel.textColor = UIColor.blackColor()
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
                responseLabel.textColor = UIColor.blackColor()
                responseLabel.text = "You may only guess a number between 0 and 1000"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess == 5 && Int(sender.titleLabel!.text!)! != 0 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.blackColor()
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            } else if guess > 5 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.blackColor()
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            }else if guess >= 10 && level == "easy" {
                color = "0"
                responseLabel.textColor = UIColor.blackColor()
                responseLabel.text = "You may only guess a number between 0 and 50"
                guess = 0
                inputLabel.text = String(guess)
            } else {
                responseLabel.text = "This is a bug. pls tell Liz!"
            }
        }
    }
    
    @IBAction func deleteButtonClicked(sender: UIButton) {
        inputLabel.text = "0"
        guess = 0
    }
    
    @IBAction func twitterButtonClicked(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            if self.tryNumber == "1" {
            tweetShare.setInitialText("I just guessed the mystery number on my first try in the Hot or Cold app on the \(self.level) level! Think you can beat that?")
            } else {
                tweetShare.setInitialText("I just guessed the mystery number in only \(self.tryNumber) tries in the Hot or Cold app on the \(self.level) level! Think you can beat that?")
            }
            self.presentViewController(tweetShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookButtonClicked(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            self.presentViewController(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    func playIncorrectSound(){
        if let path = NSBundle.mainBundle().pathForResource("negativeSound", ofType: "wav") {
            let fileURL: NSURL = NSURL(fileURLWithPath: path)
            do {
                try incorrectPlayer = AVAudioPlayer(contentsOfURL: fileURL)
            } catch {
                print("error getting incorrectSound to play")
            }
            incorrectPlayer.prepareToPlay()
            incorrectPlayer.delegate = self
            incorrectPlayer.play()
        }
    }
    
    
    func playWinningSound(){
        if let path = NSBundle.mainBundle().pathForResource("winningSound", ofType: "mp3") {
            let fileURL: NSURL = NSURL(fileURLWithPath: path)
            do {
                try winningPlayer = AVAudioPlayer(contentsOfURL: fileURL)
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