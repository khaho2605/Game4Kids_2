//
//  SocialStoryViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/6/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class SocialStoryViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func xinGiupDoBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(XinGiupDoViewController(), animated: true)

    }
    @IBAction func chaoHoiBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(ChaoHoiViewController(), animated: true)
    }
    
    @IBAction func chiaSeBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(ChiaSeViewController(), animated: true)
    }
    
    @IBAction func giupDoBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(GiupDoViewController(), animated: true)
    }
}
