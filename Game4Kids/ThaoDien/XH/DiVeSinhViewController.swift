//
//  DiVeSinhViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/17/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class DiVeSinhViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func playVideoBtnDidTap(_ sender: Any) {
        self.showVideo(name: "DiVeSinh_Video", type: "mp4")
    }
}
