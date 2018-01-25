//
//  MainViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var muteBtn: UIButton!
    static var tempMute = true
     var isMute = true {
        didSet {
            MainViewController.tempMute = isMute
            if isMute {
                player?.play()
                muteBtn.setImage(UIImage(named: "notMute"), for: .normal)
            } else {
                player?.pause()
                muteBtn.setImage(UIImage(named: "mute"), for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "AllFallDown", Extension: "mp3", repeatSound: true)
        NotificationCenter.default.addObserver(self, selector: #selector(stopMusic), name: NSNotification.Name(rawValue: "stop"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playMusic), name: NSNotification.Name(rawValue: "play"), object: nil)
    }

    @IBAction func muteBtnDidTap(_ sender: Any) {
        isMute = !isMute
    }

    @objc func stopMusic() {
        player?.pause()
    }
    
    @objc func playMusic() {
        player?.play()
    }
}
