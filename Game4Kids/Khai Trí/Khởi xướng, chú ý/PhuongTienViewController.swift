//
//  PhuongTienViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/7/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class PhuongTienViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "PHƯƠNG TIỆN"
    }

    @IBAction func xeBusBtnDidTap(_ sender: Any) {
        self.showVideo(name: "xebus", type: "MOV")
    }
    
    @IBAction func xeHoiBtnDidTap(_ sender: Any) {
        self.showVideo(name: "xehoi", type: "MOV")
    }
    
    @IBAction func tauThuyBtnDidTap(_ sender: Any) {
        self.showVideo(name: "thuyen", type: "MOV")
    }
    
    @IBAction func tauLuaBtnDidTap(_ sender: Any) {
        self.showVideo(name: "taulua", type: "MOV")
    }
    
    @IBAction func mayBayBtnDidTap(_ sender: Any) {
        self.showVideo(name: "maybay", type: "MOV")
    }
}
