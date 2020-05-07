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
    
    enum Mode {
        case xyAnimate
        case partyLights
        case blink
    }
    
    var animationMode = Mode.blink
    
    func animatePads(pad: UIView, pads: [[UIView]], currentPad: [Int], padModel: PadModel, padModels: [[PadModel]]){
        switch animationMode {
        case .blink:
            tapBlink(for: pad, padModel: padModel)
        case .partyLights:
            partyLights(for: pads)
        case .xyAnimate:
            animateXY(pads: pads, padModels: padModels, currentPad: currentPad)
        default:
            break
        }
    }
    
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
    
    func partyLights(for pads: [[UIView]]){

        var count = 0
        
        while count < 17 {
            let ii = Int.random(in: 0...3)
            let jj = Int.random(in: 0...3)
            pads[ii][jj].backgroundColor = UIColor.random()
            print(count)
            count += 1
        }
        
        count = 0
        

    }
}
