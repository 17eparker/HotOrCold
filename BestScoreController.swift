//
//  BestScoreController.swift
//  HotOrCold
//
//  Created by Liz Parker on 10/6/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import Foundation
import UIKit

class BestScoreController: UIViewController{
    @IBOutlet weak var easyLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var hardLabel: UILabel!
    
    var level = "medium"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if BestScore.useBestScore("easy") == 0 {
            easyLabel.text = "N/A"
        } else {
            easyLabel.text = String(BestScore.useBestScore("easy"))
        }
        
        if BestScore.useBestScore("medium") == 0 {
            mediumLabel.text = "N/A"
        } else {
            mediumLabel.text = String(BestScore.useBestScore("medium"))
        }
        
        if BestScore.useBestScore("hard") == 0 {
            hardLabel.text = "N/A"
        } else {
            hardLabel.text = String(BestScore.useBestScore("hard"))
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
