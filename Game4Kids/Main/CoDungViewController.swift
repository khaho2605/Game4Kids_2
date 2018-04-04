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

    @IBAction func choDenLuotBtnDidTap(_ sender: Any) {
//        let vc = XayNhaViewController()
        let vc = BanTeViewController()
        vc.title = "CHỜ ĐẾN LƯỢT"
        vc.typeView = TypeViewCoDung.ChoDenLuot
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func diXeDapBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "ĐI XE ĐẠP"
        vc.typeView = TypeViewCoDung.DiXeDap
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func vanTruotBtnDidTap(_ sender: Any) {
//        let vc = XayNhaViewController()
        let vc = BanTeViewController()
        vc.title = "CHƠI XE VÁN TRƯỢT"
        vc.typeView = TypeViewCoDung.VoChuoi
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bongRoBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "CHƠI BÓNG RỔ"
        vc.typeView = TypeViewCoDung.BongRo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func daBongBtnDidTap(_ sender: Any) {
//        let vc = XayNhaViewController()
        let vc = BanTeViewController()
        vc.title = "CHƠI ĐÁ BÓNG"
        vc.typeView = TypeViewCoDung.DaBong
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func choiChoBtnDidTap(_ sender: Any) {
        let vc = XayNhaViewController()
        vc.title = "CHƠI VỚI CHÓ"
        vc.typeView = TypeViewCoDung.ChoiVoiCho
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cauTruotBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "CHƠI VỚI CẦU TRƯỢT"
        vc.typeView = TypeViewCoDung.CauTruot
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sandwichBtnDidTap(_ sender: Any) {
//        let vc = XayNhaViewController()
        let vc = BanTeViewController()
        vc.title = "CHIA SẺ BÁNH SANDWICH"
        vc.typeView = TypeViewCoDung.ChiaSeBanh
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cungChoiBtnDidTap(_ sender: Any) {
        let vc = XayNhaViewController()
        vc.title = "CÙNG CHƠI"
        vc.typeView = TypeViewCoDung.CungChoi
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func luanPhienBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "LUÂN PHIÊN"
        vc.typeView = TypeViewCoDung.LuanPhien
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
