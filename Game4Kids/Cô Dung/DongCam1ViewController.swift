//
//  DongCam1ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/23/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class DongCam1ViewController: BaseViewController {
    
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var targetImg1: UIImageView!
    @IBOutlet weak var targetImg2: UIImageView!
    @IBOutlet weak var targetImg3: UIImageView!
    @IBOutlet weak var targetImg4: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    @IBOutlet weak var no1Lb: UILabel!
    @IBOutlet weak var no2Lb: UILabel!
    @IBOutlet weak var no3Lb: UILabel!
    @IBOutlet weak var no4Lb: UILabel!
    
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
        self.title = "ĐỒNG CẢM 1"
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

extension DongCam1ViewController {
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

extension DongCam1ViewController {
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
            playSound(name: "VoTay", Extension: "mp3")
            isFinish = 0
            playerImg1.isUserInteractionEnabled = false
            playerImg2.isUserInteractionEnabled = false
            playerImg3.isUserInteractionEnabled = false
            playerImg4.isUserInteractionEnabled = false
        }
    }
}

//MARK: Layout
extension DongCam1ViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.1
        let witdhPlayer: CGFloat = screenHeight*0.26
        let heightPlayer: CGFloat = witdhPlayer
        let widthButton: CGFloat = screenWidth*0.4
        let heightButton: CGFloat = screenHeight*0.13
//        let topMarginTarget: CGFloat = 20
        let witdhTarget: CGFloat = screenHeight*0.26
//        let heightTarget: CGFloat = witdhTarget
        let spacing: CGFloat = 32
        var spacingTarget: CGFloat = 40
        
        no1Lb.sizeToFit()
        no2Lb.sizeToFit()
        no3Lb.sizeToFit()
        no4Lb.sizeToFit()

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
        
        targetImg2.frame = CGRect(x: playerImg2.x, y: playerImg2.maxY + topMargin, width: witdhPlayer, height: witdhPlayer)
        targetImg1.frame = CGRect(x: playerImg1.x, y: targetImg2.y, width: witdhPlayer, height: witdhPlayer)
        targetImg3.frame = CGRect(x: playerImg3.x, y: targetImg2.y, width: witdhPlayer, height: witdhPlayer)
        targetImg4.frame = CGRect(x: playerImg4.x, y: targetImg2.y, width: witdhPlayer, height: witdhPlayer)
        no1Lb.frame = CGRect(x: targetImg1.x + witdhPlayer/2 - no1Lb.width/2, y: targetImg1.maxY+4, width: no1Lb.width, height: no1Lb.height)
        no2Lb.frame = CGRect(x: targetImg2.x + witdhPlayer/2 - no1Lb.width/2, y: targetImg2.maxY+4, width: no2Lb.width, height: no2Lb.height)
        no3Lb.frame = CGRect(x: targetImg3.x + witdhPlayer/2 - no1Lb.width/2, y: targetImg3.maxY+4, width: no3Lb.width, height: no3Lb.height)
        no4Lb.frame = CGRect(x: targetImg4.x + witdhPlayer/2 - no1Lb.width/2, y: targetImg4.maxY+4, width: no4Lb.width, height: no4Lb.height)

        let posX: CGFloat = screenWidth/2 - widthButton/2
        let posY: CGFloat = screenHeight - heightButton - 8
        replayBtn.frame = CGRect(x: posX, y: posY, width: widthButton, height: heightButton)
        replayBtn.layer.cornerRadius = 10
        replayBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
