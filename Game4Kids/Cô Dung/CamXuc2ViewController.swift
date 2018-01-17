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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "CẢM XÚC 2"
    }
   
    @IBAction func result1BtnDidTap(_ sender: Any) {
        playSound(name: "Wrong", Extension: "mp3", repeatSound: false)
    }
    
    @IBAction func result2BtnDidTap(_ sender: Any) {
        playSound(name: "Correct", Extension: "mp3", repeatSound: false)
    }
    
    @IBAction func result3BtnDidTap(_ sender: Any) {
        playSound(name: "Wrong", Extension: "mp3", repeatSound: false)
    }
    
    @IBAction func result4BtnDidTap(_ sender: Any) {
        playSound(name: "Wrong", Extension: "mp3", repeatSound: false)
    }
    
}
