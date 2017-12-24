//
//  DoanCamXuc22ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class DoanCamXuc22ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ĐOÁN CẢM XÚC 2.2"
    }

    @IBAction func result1BtnDidTap(_ sender: Any) {
        playSound(name: "dung roi", Extension: "wav", repeatSound: false)
    }
    
    @IBAction func result2BtnDidTap(_ sender: Any) {
        playSound(name: "thu cach khac", Extension: "wav", repeatSound: false)
    }

}
