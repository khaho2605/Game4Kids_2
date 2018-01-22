//
//  BaseViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class CustomAVPlayerViewController: AVPlayerViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
        self.player?.pause()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "play"), object: nil)
    }
}

class BaseViewController: UIViewController {

    var player: AVAudioPlayer?
    let playerViewController = CustomAVPlayerViewController()

    var isFinish: Int = 0
    var endTouch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showVideo(name: String, type: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "stop"), object: nil)
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            debugPrint("\(name).\(type) not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerViewController.showsPlaybackControls = false
        playerViewController.player = player
        //hide video when finish
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        present(playerViewController, animated: true) {
            player.play()
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.playerViewController.dismiss(animated: true)
        self.playerViewController.player?.pause()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "play"), object: nil)
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
                self.playSound(name: "Correct", Extension: "mp3")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "Wrong", Extension: "mp3")
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
    
    //Radom position on a view
    func checkContaintViewRandom2(view: UIView, framePlayer: CGRect, frameTarget: UIView, frameOrigin: CGPoint) -> Bool {
        if frameTarget.frame.contains(view.center) {
            UIView.animate(withDuration: 0.3) {
                let posXRandom = view.x//CGFloat.random(min: frameTarget.x, max: frameTarget.maxX - framePlayer.width)
                let posYRandom = frameTarget.maxY - framePlayer.height
                view.frame.origin = CGPoint(x: posXRandom , y: posYRandom)
                self.playSound(name: "Correct", Extension: "mp3")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "Wrong", Extension: "mp3")
            }
            return false
        }
    }
    func dragViewRandom2(recognizer:UIPanGestureRecognizer, target: UIView, posPlayer: CGPoint, framePlayer: CGRect){
        let translation = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == .ended {
            let check = checkContaintViewRandom2(view: recognizer.view!, framePlayer: framePlayer, frameTarget: target, frameOrigin: posPlayer)
            if check {
                self.isFinish += 1
                target.isUserInteractionEnabled = false
            }
        }
    }
    
    //Radom position on a view
    func checkContaintViewRandom(view: UIView, framePlayer: CGRect, frameTarget: UIView, frameOrigin: CGPoint) -> Bool {
        if frameTarget.frame.contains(view.center) {
            UIView.animate(withDuration: 0.3) {
                let posXRandom = CGFloat.random(min: frameTarget.x, max: frameTarget.maxX - framePlayer.width)
                let posYRandom = CGFloat.random(min: frameTarget.y, max: frameTarget.maxY - framePlayer.height)
                view.frame.origin = CGPoint(x: posXRandom , y: posYRandom)
                self.playSound(name: "Correct", Extension: "mp3")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "Wrong", Extension: "mp3")
            }
            return false
        }
    }
    func dragViewRandom(recognizer:UIPanGestureRecognizer, target: UIView, posPlayer: CGPoint, framePlayer: CGRect){
        let translation = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == .ended {
            let check = checkContaintViewRandom(view: recognizer.view!, framePlayer: framePlayer, frameTarget: target, frameOrigin: posPlayer)
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
                self.playSound(name: "Correct", Extension: "mp3")
                self.endTouch = true
            }
            return true
        } else {
            UIView.animate(withDuration: 0.3) {
                view.center = frameOrigin
                self.playSound(name: "Wrong", Extension: "mp3")
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

