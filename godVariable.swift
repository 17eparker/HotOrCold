//
//  godVariable.swift
//  Hot or Cold
//
//  Created by Liz Parker on 3/22/16.
//  Copyright © 2016 Liz Parker. All rights reserved.
//

import Foundation

class God {
    var response: String
    var win: Bool
    var tryNumber: String
    var color: String
    
    init(response: String, win: Bool, tryNumber: String, color: String) {
        self.response = response
        self.win = win
        self.tryNumber = tryNumber
        self.color = color
    }
    
}
