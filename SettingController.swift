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
    
    @IBOutlet weak var easyButton: UIButton!
    
    @IBOutlet weak var mediumButton: UIButton!
    
    @IBOutlet weak var hardButton: UIButton!
    
// fix colors!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if soundOn == true {
            soundSwitch.setOn(true, animated: true)
        } else {
            soundSwitch.setOn(false, animated: true)
        }
        if level == "easy" {
            easyArrow.isHidden = false
            mediumArrow.isHidden = true
            hardArrow.isHidden = true
        } else if level == "medium" {
            easyArrow.isHidden = true
            mediumArrow.isHidden = false
            hardArrow.isHidden = true
        } else {
            easyArrow.isHidden = true
            mediumArrow.isHidden = true
            hardArrow.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func soundSwitchTapped(_ sender: AnyObject) {
        if soundOn == true {
            soundOn = false
        } else {
            soundOn = true
        }
    }
    
   
    
    
    @IBAction func easyButtonPressed(_ sender: AnyObject) {
        level = "easy"
        easyArrow.isHidden = false
        mediumArrow.isHidden = true
        hardArrow.isHidden = true
        
    }
    
    @IBAction func mediumButtonPressed(_ sender: AnyObject) {
        level = "medium"
        easyArrow.isHidden = true
        mediumArrow.isHidden = false
        hardArrow.isHidden = true
    }
    

    @IBAction func hardButtonPressed(_ sender: AnyObject) {
        level = "hard"
        easyArrow.isHidden = true
        mediumArrow.isHidden = true
        hardArrow.isHidden = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton == (sender as! UIBarButtonItem) {
            if let homeController = segue.destination as? HomeController {
                    homeController.level = self.level
                    homeController.soundOn = self.soundOn
            }
        }
    }
}
