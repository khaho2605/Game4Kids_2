//
//  UocMoViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/9/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class CamOnViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func meTangQuaBtnDidTap(_ sender: Any) {
        let vc = MeTangQuaViewController()
        vc.typeView = TypeView.MeTangQua
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func chiaSeBtnDidTap(_ sender: Any) {
        let vc = MeTangQuaViewController()
        vc.typeView = TypeView.BanChiaSeDoChoi
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func giupMeBtnDidTap(_ sender: Any) {
        let vc = MeTangQuaViewController()
        vc.typeView = TypeView.BeGiupMe
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func coGiaoKhenBtnDidTap(_ sender: Any) {
        let vc = MeTangQuaViewController()
        vc.typeView = TypeView.CoGiaoKhen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tangQuaBtnDidTap(_ sender: Any) {
        let vc = MeTangQuaViewController()
        vc.typeView = TypeView.DuocQuaSinhNhat
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
