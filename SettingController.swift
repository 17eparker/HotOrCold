//
//  SettingController.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/30/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    var level = "medium"
    var soundOn = true
    //self.performSegueWithIdentifier("unwindToMenu", sender: self)
    
    @IBOutlet weak var easyArrow: UILabel!
    
    @IBOutlet weak var mediumArrow: UILabel!
    
    @IBOutlet weak var hardArrow: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if soundOn == true {
            soundSwitch.setOn(true, animated: true)
        } else {
            soundSwitch.setOn(false, animated: true)
        }
        if level == "easy" {
            easyArrow.hidden = false
            mediumArrow.hidden = true
            hardArrow.hidden = true
        } else if level == "medium" {
            easyArrow.hidden = true
            mediumArrow.hidden = false
            hardArrow.hidden = true
        } else {
            easyArrow.hidden = true
            mediumArrow.hidden = true
            hardArrow.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func soundSwitchTapped(sender: AnyObject) {
        if soundOn == true {
            soundOn = false
        } else {
            soundOn = true
        }
    }
    
   
    
    
    @IBAction func easyButtonPressed(sender: AnyObject) {
        level = "easy"
        easyArrow.hidden = false
        mediumArrow.hidden = true
        hardArrow.hidden = true
        
    }
    
    @IBAction func mediumButtonPressed(sender: AnyObject) {
        level = "medium"
        easyArrow.hidden = true
        mediumArrow.hidden = false
        hardArrow.hidden = true
    }
    

    @IBAction func hardButtonPressed(sender: AnyObject) {
        level = "hard"
        easyArrow.hidden = true
        mediumArrow.hidden = true
        hardArrow.hidden = false
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            if let homeController = segue.destinationViewController as? HomeController {
                    homeController.level = self.level
                    homeController.soundOn = self.soundOn
            }
        }
    }
}
