//
//  ThemeManager.swift
//  drum
//
//  Created by Josh Mabry on 5/6/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

class ThemeManager {
    
    var defaultModel = DefaultModel()
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func setDefaultTheme(pad: [[UIView]], padModel: [[PadModel]], background: UIView) {
        background.backgroundColor = hexStringToUIColor(hex: defaultModel.background)
        
        for i in 0...3 {
            for j in 0...3 {
                pad[i][j].backgroundColor = hexStringToUIColor(hex: padModel[i][j].color)
            }
        }
        
    }
    
}
