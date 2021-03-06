//
//  Pad.swift
//  drum
//
//  Created by Josh Mabry on 5/6/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

struct PadModel {
    
    var themeManager = ThemeManager()
    
    let index: [Int]
    
    let pad: UIView
    
    let color: String
    
    var lightColor: UIColor {
        themeManager.hexStringToUIColor(hex: color).lighter(by: 30)!
    }
    
    let sampleName: String
    
}
