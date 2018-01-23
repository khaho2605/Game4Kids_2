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
        vc.title = "XÂY NHÀ"
        vc.typeView = TypeViewCoDung.XayNha
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func banTeBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "BẠN TÉ"
        vc.typeView = TypeViewCoDung.BanTe
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func voChuoiBtnDidTap(_ sender: Any) {
        let vc = XayNhaViewController()
        vc.title = "TRƯỢT VỎ CHUỐI"
        vc.typeView = TypeViewCoDung.VoChuoi
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bongRoBtnDidTap(_ sender: Any) {
        let vc = BanTeViewController()
        vc.title = "CHƠI BÓNG RỔ"
        vc.typeView = TypeViewCoDung.BongRo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func biSotBtnDidTap(_ sender: Any) {
        let vc = XayNhaViewController()
        vc.title = "BỊ SỐT"
        vc.typeView = TypeViewCoDung.BiSot
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
        let vc = XayNhaViewController()
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
