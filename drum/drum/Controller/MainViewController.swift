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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func padPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
    }


}

