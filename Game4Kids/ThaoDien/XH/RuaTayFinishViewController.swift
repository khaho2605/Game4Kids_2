//
//  RuaTayFinishViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/25/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class RuaTayFinishViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func finishBtnDidTap(_ sender: Any) {
        if let vc = self.navigationController?.viewControllers[3] as? RuaTayViewController {
            self.navigationController?.popToViewController(vc, animated: true)
        }
    }
}
