//
//  ViewController.swift
//  drum
//
//  Created by Josh Mabry on 5/6/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var pad00: UIView!
    @IBOutlet weak var pad01: UIView!
    @IBOutlet weak var pad02: UIView!
    @IBOutlet weak var pad03: UIView!
    
    @IBOutlet weak var pad10: UIView!
    @IBOutlet weak var pad11: UIView!
    @IBOutlet weak var pad12: UIView!
    @IBOutlet weak var pad13: UIView!
    
    @IBOutlet weak var pad20: UIView!
    @IBOutlet weak var pad21: UIView!
    @IBOutlet weak var pad22: UIView!
    @IBOutlet weak var pad23: UIView!
    
    @IBOutlet weak var pad30: UIView!
    @IBOutlet weak var pad31: UIView!
    @IBOutlet weak var pad32: UIView!
    @IBOutlet weak var pad33: UIView!
    
    @IBOutlet weak var partyModeSwitch: UISwitch!
    @IBOutlet weak var xyModeSwitch: UISwitch!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var screenHeaderLabel: UILabel!
    
    var padManager = PadManager()
    var themeManager = ThemeManager()
    var padAnimationManager = PadAnimationManager()
    
    var padViewArray = [[UIView]]()
    var pads = [[PadModel?]]()
    
    let versionNumber = "v0.0.2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        padViewArray = [
            [pad00, pad01, pad02, pad03],
            [pad10, pad11, pad12, pad13],
            [pad20, pad21, pad22, pad23],
            [pad30, pad31, pad32, pad33]
        ]
        
        pads = padManager.createPadObjectArray(padViewArray)
        
        themeManager.setDefaultTheme(pad: padViewArray, padModel: pads as! [[PadModel]], background: backgroundImage)
        
        partyModeSwitch.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)
        xyModeSwitch.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)

        screenHeaderLabel.text = "drum \(versionNumber)"
    }
    
    
    
    @IBAction func padPressed(_ sender: UIButton) {
        let i = Int(String((sender.currentTitle?.first)!))!
        let j = Int(String((sender.currentTitle?.last)!))!
        
        padAnimationManager.animatePads(pad: padViewArray[i][j], pads: padViewArray, currentPad: [i, j], padModel: pads[i][j]!, padModels: pads as! [[PadModel]])
        
    }
    

    @objc func switchStateChanged(switchState: UISwitch) {
        print(switchState.accessibilityLabel!)
        if (switchState.isOn) {
            switch switchState.accessibilityLabel! {
            case "Party Mode Switch":
                xyModeSwitch.isOn = false
                padAnimationManager.partyLights(for: padViewArray)
                padAnimationManager.animationMode = .partyLights
                screenHeaderLabel.text = "PARTY MODE!!!!"
            case "XY Mode Switch":
                themeManager.setDefaultTheme(pad: padViewArray, padModel: pads as! [[PadModel]], background: backgroundImage)
                padAnimationManager.animationMode = .xyAnimate
                partyModeSwitch.isOn = false
            default:
                break
            }
        } else {
            switch switchState.accessibilityLabel {
            case "Party Mode Switch":
                padAnimationManager.animationMode = .blink
                themeManager.setDefaultTheme(pad: padViewArray, padModel: pads as! [[PadModel]], background: backgroundImage)
                screenHeaderLabel.text = "drum \(versionNumber)"
            case "XY Mode Switch":
                padAnimationManager.animationMode = .blink
                
            default:
                break
            }
            
            
        }
        
        
        
    }
    
}
