//
//  BaseViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit
import AVFoundation

class BaseViewController: UIViewController {

    var player: AVAudioPlayer?
    
    var isFinish: Int = 0
    var endTouch = false
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension BaseViewController {
    func playSound(name: String, Extension: String, repeatSound: Bool = false) {
        guard let url = Bundle.main.url(forResource: name, withExtension: Extension) else {
            print("Can not play this audio, please check again!!!")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            if repeatSound {
                player.numberOfLoops = -1 //Loop forever
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func checkContaintView(view:UIView, frameTarget: UIView, frameOrigin: CGPoint) -> Bool {
        if frameTarget.frame.contains(view.center) {
            UIView.animate(withDuration: 0.3) {
                view.center = frameTarget.center
                self.playSound(name: "dung roi", Extension: "wav")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "thu cach khac", Extension: "wav")
            }
            return false
        }
    }
    
    func dragView(recognizer:UIPanGestureRecognizer, target: UIView, posPlayer: CGPoint){
        let translation = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == .ended {
            let check = checkContaintView(view: recognizer.view!, frameTarget: target, frameOrigin: posPlayer)
            if check {
                self.isFinish += 1
                target.isUserInteractionEnabled = false
            }
        }
    }
    
    //Rect
    func checkContaintViewWithRect(view:UIView, frameTarget: UIView, frameOrigin: CGPoint) -> Bool {
        if frameTarget.frame.contains(view.frame.origin) {
            UIView.animate(withDuration: 0.3) {
                view.frame = frameTarget.convert(view.frame, to: frameTarget)
                self.playSound(name: "dung roi", Extension: "wav")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "thu cach khac", Extension: "wav")
            }
            return false
        }
    }
    
    func dragViewWithRect(recognizer:UIPanGestureRecognizer, target: UIView, posPlayer: CGPoint){
        let translation = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == .ended {
            let check = checkContaintViewWithRect(view: recognizer.view!, frameTarget: target, frameOrigin: posPlayer)
            if check {
                self.isFinish += 1
                target.isUserInteractionEnabled = false
            }
        }
    }
}

