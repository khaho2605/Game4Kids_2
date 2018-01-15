//
//  GiupDoViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/6/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class GiupDoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "KỸ NĂNG GIÚP ĐỠ"
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "GiupDo", bundle: nil).instantiateViewController(withIdentifier: "GiupDo") as? GiupDoDetailViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
