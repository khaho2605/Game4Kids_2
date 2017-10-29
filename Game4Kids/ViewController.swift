//
//  ViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var muteBtn: UIButton!
    var isMute = false

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "AllFallDown", Extension: "mp3")
    }

    @IBAction func muteBtnDidTap(_ sender: Any) {
        if isMute {
            player?.play()
            isMute = false
            muteBtn.setImage(UIImage(named: "notMute"), for: .normal)
        } else {
            player?.pause()
            isMute = true
            muteBtn.setImage(UIImage(named: "mute"), for: .normal)
        }

    }

}

