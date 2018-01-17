//
//  MacAoFinishViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/17/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class MacAoFinishViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func finishBtnDidTap(_ sender: Any) {
        if let vc = self.navigationController?.viewControllers[3] as? MacAoViewController {
            self.navigationController?.popToViewController(vc, animated: true)
        }
    }

}
