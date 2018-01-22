//
//  CoDungViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/22/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class CoDungViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func camXuc1BtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(CamXuc1ViewController(), animated: true)
    }

    @IBAction func xayNhaBtnDidTap(_ sender: Any) {
        let vc = XayNhaViewController()
        vc.typeView = TypeViewCoDung.XayNha
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
