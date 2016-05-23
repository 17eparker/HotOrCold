//
//  HomeController.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/9/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import UIKit
import iAd

class HomeController: UIViewController{
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    var level = "medium"
    var soundOn = true
    
    override func viewDidLoad() {
        //HomeController.canDisplayBannerAds = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToHomeController(segue: UIStoryboardSegue) {
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if settingsButton === sender {
            if let settingsController = segue.destinationViewController as? SettingsController {
                settingsController.level = self.level
                settingsController.soundOn = self.soundOn
            }
        } else if playButton === sender {
            if let gameController = segue.destinationViewController as? GameController {
                gameController.level = self.level
                gameController.soundOn = self.soundOn
            }
        }
    }
}
