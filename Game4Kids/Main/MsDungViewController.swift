//
//  MsDungViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class MsDungViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func camXuc2BtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(CamXuc2ViewController(), animated: true)
    }
    
    @IBAction func doanCamXuc1DidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DoanCamXuc1ViewController(), animated: true)
    }
    
}
