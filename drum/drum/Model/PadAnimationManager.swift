//
//  PadAnimationManager.swift
//  drum
//
//  Created by Josh Mabry on 5/6/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

class PadAnimationManager {
    var themeManager = ThemeManager()
    
    
    func tapBlink(pad: UIView, padModel: PadModel ) {
        pad.backgroundColor = themeManager.hexStringToUIColor(hex: "#FFFFFF")
        let secondsToDelay = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            pad.backgroundColor = self.themeManager.hexStringToUIColor(hex: padModel.color)
        }
    }
    
}
