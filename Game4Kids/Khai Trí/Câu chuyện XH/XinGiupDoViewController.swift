//
//  XinGiupDoViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/9/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class XinGiupDoViewController: BaseViewController {

    @IBOutlet weak var meBeImg: UIImageView!
    @IBOutlet weak var beKeoImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func tapGestureOnView(_ sender: Any) {
        let xPosition = meBeImg.maxX - 50
        let yPosition = beKeoImg.frame.origin.y
        
        let height = beKeoImg.frame.size.height
        let width = beKeoImg.frame.size.width
        
        UIView.animate(withDuration: 3.0, animations: {
            self.beKeoImg.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
    }
}
