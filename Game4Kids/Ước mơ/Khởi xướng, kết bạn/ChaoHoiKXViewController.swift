//
//  ChaoHoiKXViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/9/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class ChaoHoiKXViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "CHÀO HỎI KHỞI XƯỚNG KẾT BẠN"
    }

    @IBAction func nextBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(ChaoHoiKXResultViewController(), animated: true)
    }
}
