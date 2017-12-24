//
//  DongCam2ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/24/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class DongCam2ViewController: BaseViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var targetImg1: UIImageView!
    @IBOutlet weak var arrowLb1: UILabel!
    @IBOutlet weak var arrowLb2: UILabel!
    @IBOutlet weak var arrowLb3: UILabel!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrOrigin = getPos()
//        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
//        setPosition(arrData: data)
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionForGesture)))
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
        self.title = "ĐỒNG CẢM 2"
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
    }
}

extension DongCam2ViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
    }
}

extension DongCam2ViewController {
    func actionForGesture(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? 0
        let viewPlayer = recognizer.view
        switch tagView {
        case 1:
//            targetView = targetImg2
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            targetView = targetImg1
            posOrigin = originPlayer2 ?? CGPoint.zero
       
        case 3:
//            targetView = targetImg3
            posOrigin = originPlayer3 ?? CGPoint.zero
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
        if isFinish == 1 {
            print("Value", isFinish)
            playSound(name: "be that gioi", Extension: "wav")
            isFinish = 0
            playerImg1.isUserInteractionEnabled = false
            playerImg2.isUserInteractionEnabled = false
            playerImg3.isUserInteractionEnabled = false
        }
    }
}

//MARK: Layout
extension DongCam2ViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.1
        let witdhPlayer: CGFloat = screenHeight*0.26
        let heightPlayer: CGFloat = witdhPlayer
        let widthButton: CGFloat = screenWidth*0.2
        let heightButton: CGFloat = screenHeight*0.26
        let topMarginTarget: CGFloat = screenHeight*0.08
        let witdhTarget: CGFloat = screenHeight*0.26
        let heightTarget: CGFloat = witdhTarget
        let spacing: CGFloat = 50
//        var spacingTarget: CGFloat = 40
//        let marginLb: CGFloat = 8
        
        arrowLb1.sizeToFit()
        arrowLb2.sizeToFit()
        arrowLb3.sizeToFit()

        if !DeviceType.IS_IPAD {
//            spacingTarget = 20
        }
        let centerX = self.view.center.x
        
        arrowLb2.frame = CGRect(x: centerX  - arrowLb1.width/2, y: topMargin + heightPlayer/2 - arrowLb2.height/2, width: arrowLb2.width, height: arrowLb2.height)
        image2.frame = CGRect(x: arrowLb2.x - witdhPlayer, y: topMargin, width: witdhPlayer, height: heightPlayer)
        arrowLb1.frame = CGRect(x: image2.x - arrowLb1.width , y: arrowLb2.y, width: arrowLb1.width, height: arrowLb1.height)
        image1.frame = CGRect(x: arrowLb1.x - witdhPlayer, y: topMargin, width: witdhPlayer, height: heightPlayer)
        image3.frame = CGRect(x: arrowLb2.maxX, y: topMargin, width: witdhPlayer, height: heightPlayer)
        arrowLb3.frame = CGRect(x: image3.maxX , y: arrowLb2.y, width: arrowLb3.width, height: arrowLb3.height)
        targetImg1.frame = CGRect(x: arrowLb3.maxX, y: topMargin, width: witdhTarget, height: heightTarget)

        playerImg2.frame = CGRect(x: centerX - witdhPlayer/2, y: image2.maxY + topMarginTarget, width: witdhPlayer, height: heightPlayer)
        playerImg3.frame = CGRect(x: playerImg2.maxX + spacing, y: playerImg2.y, width: witdhPlayer, height: heightPlayer)
        playerImg1.frame = CGRect(x: playerImg2.x - spacing -  witdhPlayer, y: playerImg2.y, width: witdhPlayer, height: heightPlayer)

        playerImg1.layer.masksToBounds = true
        playerImg2.layer.masksToBounds = true
        playerImg3.layer.masksToBounds = true
        playerImg1.layer.cornerRadius = 5
        playerImg2.layer.cornerRadius = 5
        playerImg3.layer.cornerRadius = 5
        
        let posX: CGFloat = screenWidth - widthButton - 8
        let posY: CGFloat = screenHeight - heightButton - 8
        replayBtn.frame = CGRect(x: posX, y: posY, width: widthButton, height: heightButton)
        replayBtn.layer.cornerRadius = 10
        replayBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
