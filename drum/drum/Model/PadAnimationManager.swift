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
    
    var partyLights = true
    
    func tapBlink(for pad: UIView) {
        let prevColor = pad.backgroundColor
        pad.backgroundColor = pad.backgroundColor?.lighter(by: 30)
        let secondsToDelay = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            pad.backgroundColor = prevColor
        }
        
    }
    
    func animateXY(for pads: [[UIView]]) {
        for i in 0...3 {
            let pad = pads[0][i]
            tapBlink(for: pad)
        }
    }
    
}
