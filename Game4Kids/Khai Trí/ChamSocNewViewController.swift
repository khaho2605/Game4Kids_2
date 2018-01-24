//
//  ChamSocNewViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/24/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class ChamSocNewViewController: BaseViewController {

    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var targetImg1: UIView!
    @IBOutlet weak var targetImg2: UIView!
    @IBOutlet weak var targetImg3: UIView!
    @IBOutlet weak var targetImg4: UIView!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        
        targetImg1.backgroundColor = .clear
        targetImg2.backgroundColor = .clear
        targetImg3.backgroundColor = .clear
        targetImg4.backgroundColor = .clear
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
    }
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        targetImg1.backgroundColor = .clear
        targetImg2.backgroundColor = .clear
        targetImg3.backgroundColor = .clear
        targetImg4.backgroundColor = .clear

    }
}

//MARK: Add gesture
extension ChamSocNewViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
        //        arr.append(playerImg5.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        playerImg4.frame.origin = arrData[3]
        //        playerImg5.frame.origin = arrData[4]
        
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
        //        originPlayer5 = playerImg5.center
    }
}

extension ChamSocNewViewController {
    @objc func actionForGesture(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? 0
        let viewPlayer = recognizer.view
        switch tagView {
        case 1:
            targetView = targetImg1
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            targetView = targetImg2
            posOrigin = originPlayer2 ?? CGPoint.zero
        case 3:
            targetView = targetImg3
            posOrigin = originPlayer3 ?? CGPoint.zero
        case 4:
            targetView = targetImg4
            posOrigin = originPlayer4 ?? CGPoint.zero
        default:
            break
        }
        dragView(recognizer: recognizer, target: targetView, posPlayer: posOrigin)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                viewPlayer?.isUserInteractionEnabled = false
                endTouch = false
                targetView.backgroundColor = .clear
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 4 {
            print("Value", isFinish)
            playSound(name: "VoTay", Extension: "mp3")
            isFinish = 0
            playerImg1.isUserInteractionEnabled = false
            playerImg2.isUserInteractionEnabled = false
            playerImg3.isUserInteractionEnabled = false
            playerImg4.isUserInteractionEnabled = false
        }
    }
}
