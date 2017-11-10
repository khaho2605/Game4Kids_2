//
//  GameViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {
    
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var playerImg5: UIImageView!
    @IBOutlet weak var playerImg6: UIImageView!
    @IBOutlet weak var playerImg7: UIImageView!
    
    @IBOutlet weak var targetView1: UIView!
    @IBOutlet weak var targetView2: UIView!
    @IBOutlet weak var replayBtn: UIButton!
    @IBOutlet weak var bathRoomLb: UILabel!
    @IBOutlet weak var bedRoomLb: UILabel!
    
    var originPlayer:CGPoint?
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
    var originPlayer5:CGPoint?
    var originPlayer6:CGPoint?
    var originPlayer7:CGPoint?
    
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        
        playerImg.tag  = 0
        playerImg1.tag = 1
        playerImg2.tag = 2
        playerImg3.tag = 3
        playerImg4.tag = 4
        playerImg5.tag = 5
        playerImg6.tag = 6
        playerImg7.tag = 7

        playerImg.isUserInteractionEnabled = true
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
        playerImg7.isUserInteractionEnabled = true

        playerImg.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg7.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Game No.1"
    }
    
    @IBAction func didTapReplayBtn(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg.isUserInteractionEnabled = true
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
        playerImg7.isUserInteractionEnabled = true
    }
}

//MARK: Add gesture
extension GameViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg.frame.origin)
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
        arr.append(playerImg5.frame.origin)
        arr.append(playerImg6.frame.origin)
        arr.append(playerImg7.frame.origin)

        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg.frame.origin  = arrData[0]
        playerImg1.frame.origin = arrData[1]
        playerImg2.frame.origin = arrData[2]
        playerImg3.frame.origin = arrData[3]
        playerImg4.frame.origin = arrData[4]
        playerImg5.frame.origin = arrData[5]
        playerImg6.frame.origin = arrData[6]
        playerImg7.frame.origin = arrData[7]
        
        originPlayer  = playerImg.center
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
        originPlayer5 = playerImg5.center
        originPlayer6 = playerImg6.center
        originPlayer7 = playerImg7.center
    }
}

extension GameViewController {
    
    func actionDragView(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? -1
        let playerView = recognizer.view
        switch tagView {
        case 0:
            targetView = targetView1
            posOrigin = originPlayer ?? CGPoint.zero
        case 1:
            targetView = targetView1
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            targetView = targetView1
            posOrigin = originPlayer2 ?? CGPoint.zero
        case 3:
            targetView = targetView1
            posOrigin = originPlayer3 ?? CGPoint.zero
        case 4:
            targetView = targetView2
            posOrigin = originPlayer4 ?? CGPoint.zero
        case 5:
            targetView = targetView2
            posOrigin = originPlayer5 ?? CGPoint.zero
        case 6:
            targetView = targetView2
            posOrigin = originPlayer6 ?? CGPoint.zero
        case 7:
            targetView = targetView2
            posOrigin = originPlayer7 ?? CGPoint.zero
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
        if isFinish == 8 {
            print("Game is finish---------")
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
    }
}

extension GameViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        
        let spacing: CGFloat = 20
        let widthTargetView: CGFloat = screenWidth * 0.44
        let heightTargetView: CGFloat = screenHeight * 0.4
        let witdhPlayer: CGFloat = screenHeight*0.15
        
        let centerX: CGFloat = self.view.center.x
        let topMargin: CGFloat = screenHeight*0.15
        let margin: CGFloat = 12
        let radius: CGFloat = 8
        
        bathRoomLb.sizeToFit()
        bedRoomLb.sizeToFit()
        
        
        
        self.targetView1.frame = CGRect(x: 20, y: replayBtn.frame.origin.y-heightTargetView-8, width: widthTargetView, height: heightTargetView)
        self.targetView2.frame = CGRect(x: screenWidth-spacing-widthTargetView, y: targetView1.frame.origin.y, width: widthTargetView, height: heightTargetView)
        
        bathRoomLb.frame = CGRect(x: targetView1.frame.origin.x + 8, y: targetView1.frame.origin.y + 8 , width: bathRoomLb.frame.width, height: bathRoomLb.frame.height)
        bedRoomLb.frame = CGRect(x: targetView2.frame.origin.x + 8, y: targetView2.frame.origin.y + 8 , width: bedRoomLb.frame.width, height: bedRoomLb.frame.height)

        self.playerImg3.frame = CGRect(x: centerX - witdhPlayer - margin/2, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg2.frame = CGRect(x: playerImg3.frame.origin.x - witdhPlayer - margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg1.frame = CGRect(x: playerImg2.frame.origin.x - witdhPlayer - margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg.frame = CGRect(x: playerImg1.frame.origin.x - witdhPlayer - margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)

        self.playerImg4.frame = CGRect(x: centerX + margin/2, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg5.frame = CGRect(x: playerImg4.frame.maxX + margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg6.frame = CGRect(x: playerImg5.frame.maxX + margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        self.playerImg7.frame = CGRect(x: playerImg6.frame.maxX + margin, y: topMargin, width: witdhPlayer, height: witdhPlayer)

        targetView1.layer.cornerRadius = radius
        targetView2.layer.cornerRadius = radius
    }
}

