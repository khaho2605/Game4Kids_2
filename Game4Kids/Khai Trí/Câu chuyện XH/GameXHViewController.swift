//
//  GameXHViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/15/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class GameXHViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gameGiupDoBtnDidTap(_ sender: Any) {
        let vc = ChangeClothesViewController()
        vc.typeView = TypeViewThaoDien.GiupDo.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func gameChaoHoiBtnDidTap(_ sender: Any) {
        let vc = HandwashingViewController()
        vc.typeView = TypeViewThaoDien.ChaoHoi.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func gameChiaSeBtnDidTap(_ sender: Any) {
        let vc = ChangeClothesViewController()
        vc.typeView = TypeViewThaoDien.ChiaSe.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
