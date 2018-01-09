//
//  GoWCViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/16/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class GoWCViewController: BaseViewController {
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var targetImg1: UIImageView!
    @IBOutlet weak var targetImg2: UIImageView!
    @IBOutlet weak var targetImg3: UIImageView!
    @IBOutlet weak var targetImg4: UIImageView!
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
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ĐI VỆ SINH"
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
    }
}

extension GoWCViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        playerImg4.frame.origin = arrData[3]
        
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
    }
}

extension GoWCViewController {
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
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 4 {
            print("Value", isFinish)
            playSound(name: "be that gioi", Extension: "wav")
            isFinish = 0
            playerImg1.isUserInteractionEnabled = false
            playerImg2.isUserInteractionEnabled = false
            playerImg3.isUserInteractionEnabled = false
            playerImg4.isUserInteractionEnabled = false
        }
    }
}

//MARK: Layout
extension GoWCViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.1
        let witdhPlayer: CGFloat = screenHeight*0.26
        let heightPlayer: CGFloat = witdhPlayer
        let widthButton: CGFloat = screenWidth*0.2
        let heightButton: CGFloat = screenHeight*0.26
        let topMarginTarget: CGFloat = 20
        let witdhTarget: CGFloat = screenHeight*0.26
        let heightTarget: CGFloat = witdhTarget
        let spacing: CGFloat = 32
        var spacingTarget: CGFloat = 40

        if !DeviceType.IS_IPAD {
            spacingTarget = 20
        }
        let centerX = self.view.center.x
        
        playerImg2.frame = CGRect(x: centerX - spacing/2 - witdhPlayer, y: topMargin, width: witdhPlayer, height: witdhPlayer)
        playerImg1.frame = CGRect(x: playerImg2.frame.origin.x-spacing-witdhPlayer, y: playerImg2.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg3.frame = CGRect(x: centerX + spacing/2, y: topMargin, width: witdhPlayer, height: heightPlayer)
        playerImg4.frame = CGRect(x: playerImg3.frame.maxX+spacing, y: topMargin, width: witdhPlayer, height: heightPlayer)
        
        
        playerImg1.layer.cornerRadius = 5
        playerImg2.layer.cornerRadius = 5
        playerImg3.layer.cornerRadius = 5
        playerImg4.layer.cornerRadius = 5
        
        
        targetImg1.frame = CGRect(x: centerX - witdhTarget - spacingTarget/2, y: playerImg1.frame.maxY+topMarginTarget, width: witdhTarget, height: heightTarget)
        targetImg2.frame = CGRect(x: targetImg1.frame.origin.x, y: targetImg1.frame.maxY + spacingTarget, width: witdhTarget, height: heightTarget)
        targetImg3.frame = CGRect(x: centerX + spacingTarget/2, y: targetImg1.frame.origin.y, width: witdhTarget, height: heightTarget)
        targetImg4.frame = CGRect(x: targetImg3.frame.origin.x, y: targetImg3.frame.maxY + spacingTarget, width: witdhTarget, height: heightTarget)
        
        let posX: CGFloat = screenWidth - widthButton - 8
        let posY: CGFloat = screenHeight - heightButton - 8
        replayBtn.frame = CGRect(x: posX, y: posY, width: widthButton, height: heightButton)
        replayBtn.layer.cornerRadius = 10
        replayBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
