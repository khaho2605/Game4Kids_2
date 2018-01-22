//
//  IntroHandwashingViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/16/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class IntroHandwashingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Rửa Tay"
    }

    @IBAction func playBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(HandwashingViewController(), animated: true)

    }
    
}
