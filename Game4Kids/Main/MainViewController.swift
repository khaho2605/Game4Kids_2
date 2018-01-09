//
//  MainViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    static let sharedInstance = MainViewController()

    @IBOutlet weak var muteBtn: UIButton!
    var isMute = false

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "AllFallDown", Extension: "mp3", repeatSound: true)
        NotificationCenter.default.addObserver(self, selector: #selector(stopMusic), name: NSNotification.Name(rawValue: "stop"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playMusic), name: NSNotification.Name(rawValue: "play"), object: nil)
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

    @objc func stopMusic() {
        player?.pause()
    }
    
    @objc func playMusic() {
        player?.play()
    }
}
