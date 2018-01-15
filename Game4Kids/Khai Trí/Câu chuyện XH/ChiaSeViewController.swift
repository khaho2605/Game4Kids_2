//
//  ChiaSeViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/6/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class ChiaSeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "KỸ NĂNG CHIA SẺ"
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "ChiaSe", bundle: nil).instantiateViewController(withIdentifier: "ChiaSe") as? ChiaSeDetailViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
