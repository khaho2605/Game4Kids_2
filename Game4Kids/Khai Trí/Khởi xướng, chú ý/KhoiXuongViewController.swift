//
//  KhoiXuongViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/7/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class KhoiXuongViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dongVatBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DongVatViewController(), animated: true)
    }
    
    @IBAction func phuongTienBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(PhuongTienViewController(), animated: true)
    }
    
    @IBAction func nhacCuBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(NhacCuViewController(), animated: true)
    }
}
