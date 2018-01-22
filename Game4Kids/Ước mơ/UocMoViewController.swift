//
//  UocMoViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/9/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class UocMoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chiaSeDoChoiBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(ChiaSeDoChoiViewController(), animated: true)
    }
    @IBAction func chaoHoiKXBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(ChaoHoiKXViewController(), animated: true)

    }
}
