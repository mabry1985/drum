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
    
    var xyAnimate = true
    
    func tapBlink(for pad: UIView, padModel: PadModel) {
        pad.backgroundColor = padModel.lightColor
        let secondsToDelay = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            pad.backgroundColor = self.themeManager.hexStringToUIColor(hex: padModel.color)
        }
        
    }
    
    func animateXY(pads: [[UIView]], padModels: [[PadModel]], currentPad: [Int]) {
        let currentX = currentPad[0]
        let currentY = currentPad[1]
        
        if (currentX < 4) {
            var counter = currentX
            while counter < 4 {
                tapBlink(for: pads[counter][currentY], padModel: padModels[currentX][currentY])
                counter += 1
            }
        }

        if (currentY < 4) {
            var counter = currentY
            while counter < 4 {
                tapBlink(for: pads[currentX][counter], padModel: padModels[currentX][currentY])
                print("im in y loop")
                counter += 1
            }
        }
        
        if (currentX > 0) {
            var counter = currentX
            while counter >= 0 {
                tapBlink(for: pads[counter][currentY], padModel: padModels[currentX][currentY])
                print("im in x loop")
                counter -= 1
            }
        }

        if (currentY > 0) {
            var counter = currentY
            while counter >= 0 {
                tapBlink(for: pads[currentX][counter], padModel: padModels[currentX][currentY])
                print("im in y loop")
                counter -= 1
            }
        }
        
    }
}
