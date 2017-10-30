//
//  BrushTeethViewController.swift
//  Game4Kids
//
//  Created by KHA on 10/29/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class BrushTeethViewController: BaseViewController {
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var playerImg5: UIImageView!
    @IBOutlet weak var playerImg6: UIImageView!
    
    @IBOutlet weak var targetImg1: UIImageView!
    @IBOutlet weak var targetImg2: UIImageView!
    @IBOutlet weak var targetImg3: UIImageView!
    @IBOutlet weak var targetImg4: UIImageView!
    @IBOutlet weak var targetImg5: UIImageView!
    @IBOutlet weak var targetImg6: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
    var originPlayer5:CGPoint?
    var originPlayer6:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
    }
}

//MARK: Add gesture
extension BrushTeethViewController {
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

extension BrushTeethViewController {
    func actionForGesture(recognizer: UIPanGestureRecognizer) {
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
        case 5:
            targetView = targetImg5
            posOrigin = originPlayer5 ?? CGPoint.zero
        case 6:
            targetView = targetImg6
            posOrigin = originPlayer6 ?? CGPoint.zero
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
        if isFinish == 6 {
            print("Value", isFinish)
            playSound(name: "be that gioi", Extension: "wav")
            isFinish = 0
            playerImg1.isUserInteractionEnabled = false
            playerImg2.isUserInteractionEnabled = false
            playerImg3.isUserInteractionEnabled = false
            playerImg4.isUserInteractionEnabled = false
            playerImg5.isUserInteractionEnabled = false
            playerImg6.isUserInteractionEnabled = false
        }
    }
}

//MARK: Layout
extension BrushTeethViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.22
        let witdhPlayer: CGFloat = screenHeight*0.2
        let heightPlayer: CGFloat = witdhPlayer
        let widthButton: CGFloat = screenWidth*0.2
        let heightButton: CGFloat = screenHeight*0.26
        let topMarginTarget: CGFloat = screenHeight*0.2
        let witdhTarget: CGFloat = screenHeight*0.23
        let heightTarget: CGFloat = witdhTarget
        let spacing: CGFloat = 15
        let radius: CGFloat = 5
        
        playerImg3.frame = CGRect(x: 0, y: topMargin, width: witdhPlayer, height: heightPlayer)
        playerImg3.center = CGPoint(x: self.view.center.x-witdhPlayer/2, y: playerImg3.frame.origin.y)
        
        playerImg2.frame = CGRect(x: playerImg3.frame.origin.x-spacing-witdhPlayer, y: playerImg3.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg1.frame = CGRect(x: playerImg2.frame.origin.x-spacing-witdhPlayer, y: playerImg3.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        
        playerImg4.frame = CGRect(x: playerImg3.frame.maxX+spacing, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg5.frame = CGRect(x: playerImg4.frame.maxX+spacing, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg6.frame = CGRect(x: playerImg5.frame.maxX+spacing, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        
        playerImg1.layer.cornerRadius = radius
        playerImg2.layer.cornerRadius = radius
        playerImg3.layer.cornerRadius = radius
        playerImg4.layer.cornerRadius = radius
        playerImg5.layer.cornerRadius = radius
        playerImg6.layer.cornerRadius = radius
        
        targetImg2.frame = CGRect(x: 0, y: playerImg1.frame.maxY+topMarginTarget, width: witdhTarget, height: heightTarget)
        targetImg2.center = CGPoint(x: self.view.center.x, y: targetImg2.frame.origin.y)
        targetImg1.frame = CGRect(x: targetImg2.frame.origin.x-spacing-witdhTarget, y: targetImg2.frame.origin.y, width: witdhTarget, height: heightTarget)
        
        targetImg3.frame = CGRect(x: targetImg2.frame.maxX+spacing, y: targetImg2.frame.origin.y, width: witdhTarget, height: heightTarget)
        targetImg4.frame = CGRect(x: targetImg1.frame.origin.x, y: targetImg1.frame.maxY+spacing, width: witdhTarget, height: heightTarget)
        targetImg5.frame = CGRect(x: targetImg4.frame.maxX+spacing, y: targetImg4.frame.origin.y, width: witdhTarget, height: heightTarget)
        targetImg6.frame = CGRect(x: targetImg5.frame.maxX+spacing, y: targetImg4.frame.origin.y, width: witdhTarget, height: heightTarget)
        
        let posX: CGFloat = screenWidth - widthButton - 8
        let posY: CGFloat = screenHeight - heightButton - 8
        
        replayBtn.frame = CGRect(x: posX, y: posY, width: widthButton, height: heightButton)
        replayBtn.layer.cornerRadius = radius * 2
        replayBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
