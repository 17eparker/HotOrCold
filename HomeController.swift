//
//  HomeController.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/9/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import UIKit


class HomeController: UIViewController{
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    var level = "medium"
    var soundOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToHomeController(_ segue: UIStoryboardSegue) {
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if settingsButton == (sender as! UIButton) {
            if let settingsController = segue.destination as? SettingsController {
                settingsController.level = self.level
                settingsController.soundOn = self.soundOn
            }
        } else if playButton == (sender as! UIButton) {
            if let gameController = segue.destination as? GameController {
                gameController.level = self.level
                gameController.soundOn = self.soundOn
            }
        }
    }
}
