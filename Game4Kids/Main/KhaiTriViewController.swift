//
//  KhaiTriViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/26/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class KhaiTriViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func bubbleBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(BubbleViewController(), animated: true)
    }
}
