//
//  PadManager.swift
//  drum
//
//  Created by Josh Mabry on 5/6/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

class PadManager {
        
    var padObjectArray = Array(repeating: Array(repeating: PadModel(index: [Int](), pad: UIView(), color: String(), sampleName: String()), count: 4), count: 4)
    var padCount = 16
    let defaultValues = DefaultValues()
    
    func createPadObjectArray(_ array: [[UIView]]) -> [[PadModel?]]{
        for i in 0...3 {
            for j in 0...3 {
                let pad = PadModel(index: [i, j],  pad: UIView(), color: defaultValues.padColor, sampleName: defaultValues.sampleName[i][j])
                padObjectArray[i][j] = pad
            }
        }
        
        return padObjectArray
    }
    
}
