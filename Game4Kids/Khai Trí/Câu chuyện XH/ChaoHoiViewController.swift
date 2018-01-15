//
//  ChaoHoiViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/6/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class ChaoHoiViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "ChaoHoi", bundle: nil).instantiateViewController(withIdentifier: "ChaoHoi") as? ChaoHoiDetailViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "KỸ NĂNG CHÀO HỎI"
    }
}
