//
//  GameViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {
    
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var playerImg5: UIImageView!
    @IBOutlet weak var playerImg6: UIImageView!
    @IBOutlet weak var targetView1: UIView!
    @IBOutlet weak var targetView2: UIView!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
    var originPlayer5:CGPoint?
    var originPlayer6:CGPoint?
    
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrOrigin = getPos()
        setPosition(arrData: arrOrigin)
        
        playerImg1.tag = 1
        playerImg2.tag = 2
        playerImg3.tag = 3
        playerImg4.tag = 4
        playerImg5.tag = 5
        playerImg6.tag = 6

        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ABC"
    }
    
}

//MARK: Add gesture
extension GameViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
        arr.append(playerImg5.frame.origin)
        arr.append(playerImg6.frame.origin)
        
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        playerImg4.frame.origin = arrData[3]
        playerImg5.frame.origin = arrData[4]
        playerImg6.frame.origin = arrData[5]
        
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
        originPlayer5 = playerImg5.center
        originPlayer6 = playerImg6.center
    }
}

extension GameViewController {
    
    func actionDragView(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? 0
        let playerView = recognizer.view
        switch tagView {
        case 1:
            targetView = targetView1
            posOrigin = originPlayer1!
        case 2:
            targetView = targetView1
            posOrigin = originPlayer2!
        case 3:
            targetView = targetView1
            posOrigin = originPlayer3!
        case 4:
            targetView = targetView2
            posOrigin = originPlayer4!
        case 5:
            targetView = targetView2
            posOrigin = originPlayer5!
        case 6:
            targetView = targetView2
            posOrigin = originPlayer6!
        default:
            break
        }
        dragViewWithRect(recognizer: recognizer, target: targetView, posPlayer: posOrigin)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerView?.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 6 {
            print("Game is finish---------")
        }
    }
}

