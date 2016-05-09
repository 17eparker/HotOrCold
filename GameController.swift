//
//  GameController.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/9/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import UIKit
import AVFoundation


class GameController: UIViewController, AVAudioPlayerDelegate {
    
    var level = "medium"
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var lastGuessLabel: UILabel!
    
    @IBOutlet weak var triesLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    let response = Response()
    var guess = 0
    var answer = 0
    var displayingEnter = true
    var incorrectPlayer: AVAudioPlayer!
    var winningPlayer: AVAudioPlayer!
    var error: NSError?
    var soundOn = true
    
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
            if godObject.win == true {
                if soundOn == true {
                    playWinningSound()
                }
                EnterPlayAgainButton.setTitle("Yes", forState: .Normal)
                displayingEnter = false
            } else {
                if soundOn == true {
                    playIncorrectSound()
                }
            }
        } else {
            EnterPlayAgainButton.setTitle("Enter", forState: .Normal)
            displayingEnter = true
            triesLabel.text = "0"
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
        if guess == 0 {
            inputLabel.text = sender.titleLabel!.text
            guess = Int(inputLabel.text!)! //need to change label before setting guess
        } else if guess > 0 && guess < 10 {
            guess = guess * 10 + Int(sender.titleLabel!.text!)!
            inputLabel.text = String(guess)
        } else if guess == 10 && Int(sender.titleLabel!.text!)! == 0 && level == "medium" {
            guess = 100
            inputLabel.text = String(guess)
        } else if guess == 10 && Int(sender.titleLabel!.text!)! != 0 && level == "medium" {
            responseLabel.text = "You may only guess a number between 0 and 100"
        } else if guess >= 10 && level == "hard" {
            guess = guess * 10 + Int(sender.titleLabel!.text!)!
            inputLabel.text = String(guess)
        } else if guess == 100 && Int(sender.titleLabel!.text!)! == 0 && level == "hard" {
            guess = 1000
            inputLabel.text = String(guess)
        } else if guess > 100 && level == "hard" {
            responseLabel.text = "You may only guess a number between 0 and 1000"
        } else if guess >= 5 && Int(sender.titleLabel!.text!)! != 0 && level == "easy" {
            responseLabel.text = "You may only guess a number between 0 and 50"
        } else if guess >= 10 && level == "easy" {
            responseLabel.text = "You may only guess a number between 0 and 50"
        } else {
            responseLabel.text = "This is a bug. pls tell Liz!"
        }
    }
    
    @IBAction func deleteButtonClicked(sender: UIButton) {
        inputLabel.text = "0"
        guess = 0
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