//
//  CamXuc2ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class CamXuc2ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func result1BtnDidTap(_ sender: Any) {
        playSound(name: "thu cach khac", Extension: "wav", repeatSound: false)
    }
    
    @IBAction func result2BtnDidTap(_ sender: Any) {
        playSound(name: "dung roi", Extension: "wav", repeatSound: false)
    }
    
    @IBAction func result3BtnDidTap(_ sender: Any) {
        playSound(name: "thu cach khac", Extension: "wav", repeatSound: false)
    }
    
    @IBAction func result4BtnDidTap(_ sender: Any) {
        playSound(name: "thu cach khac", Extension: "wav", repeatSound: false)
    }
    
}
