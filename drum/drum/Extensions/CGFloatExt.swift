//
//  CGFloatExt.swift
//  drum
//
//  Created by Josh Mabry on 5/7/20.
//  Copyright © 2020 Josh Mabry. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
