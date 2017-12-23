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
    
    @IBAction func dongCam1DidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DongCam1ViewController(), animated: true)
    }
    
    
    @IBAction func doanCamXuc1DidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DoanCamXuc1ViewController(), animated: true)
    }
    
    @IBAction func doanCamXuc21DidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DoanCamXuc21ViewController(), animated: true)
    }
    
    @IBAction func doanCamXuc22DidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DoanCamXuc22ViewController(), animated: true)

    }
}
