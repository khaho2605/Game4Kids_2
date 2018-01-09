//
//  CamXuc1ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/24/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class CamXuc1ViewController: BaseViewController {

    @IBOutlet weak var happyView: UIView!
    @IBOutlet weak var sadView: UIView!
    @IBOutlet weak var angryView: UIView!
    @IBOutlet weak var afraidView: UIView!
    @IBOutlet weak var happyLb: UILabel!
    @IBOutlet weak var sadLb: UILabel!
    @IBOutlet weak var angryLb: UILabel!
    @IBOutlet weak var afraidLb: UILabel!
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
//    @IBOutlet weak var playerImg5: UIImageView!
//    @IBOutlet weak var playerImg6: UIImageView!
//    @IBOutlet weak var playerImg7: UIImageView!
//    @IBOutlet weak var playerImg8: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
//    var originPlayer5:CGPoint?
//    var originPlayer6:CGPoint?
//    var originPlayer7:CGPoint?
//    var originPlayer8:CGPoint?
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
//        playerImg5.isUserInteractionEnabled = true
//        playerImg6.isUserInteractionEnabled = true
//        playerImg7.isUserInteractionEnabled = true
//        playerImg8.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
//        playerImg5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
//        playerImg6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
//        playerImg7.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
//        playerImg8.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "CẢM XÚC 1"
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
//        playerImg5.isUserInteractionEnabled = true
//        playerImg6.isUserInteractionEnabled = true
//        playerImg7.isUserInteractionEnabled = true
//        playerImg8.isUserInteractionEnabled = true
    }
}

extension CamXuc1ViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
//        arr.append(playerImg5.frame.origin)
//        arr.append(playerImg6.frame.origin)
//        arr.append(playerImg7.frame.origin)
//        arr.append(playerImg8.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        playerImg4.frame.origin = arrData[3]
//        playerImg5.frame.origin = arrData[4]
//        playerImg6.frame.origin = arrData[5]
//        playerImg7.frame.origin = arrData[6]
//        playerImg8.frame.origin = arrData[7]
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
//        originPlayer5 = playerImg5.center
//        originPlayer6 = playerImg6.center
//        originPlayer7 = playerImg7.center
//        originPlayer8 = playerImg8.center
    }
}

extension CamXuc1ViewController {
    
    @objc func actionDragView(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? -1
        let playerView = recognizer.view
        switch tagView {
        case 1:
            targetView = happyView
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            targetView = sadView
            posOrigin = originPlayer2 ?? CGPoint.zero
        case 3:
            targetView = angryView
            posOrigin = originPlayer3 ?? CGPoint.zero
        case 4:
            targetView = afraidView
            posOrigin = originPlayer4 ?? CGPoint.zero
//        case 5:
//            targetView = angryView
//            posOrigin = originPlayer5 ?? CGPoint.zero
//        case 6:
//            targetView = angryView
//            posOrigin = originPlayer6 ?? CGPoint.zero
//        case 7:
//            targetView = afraidView
//            posOrigin = originPlayer7 ?? CGPoint.zero
//        case 8:
//            targetView = afraidView
//            posOrigin = originPlayer8 ?? CGPoint.zero
        default:
            break
        }
        dragView(recognizer: recognizer, target: targetView, posPlayer: posOrigin)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerView?.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 4 {
            print("Game is finish---------")
            playSound(name: "be that gioi", Extension: "wav")
        }
    }
}

extension CamXuc1ViewController {
    func layout() {
//        let screenHeight: CGFloat = self.view.frame.height
//        let screenWidth: CGFloat = self.view.frame.width
//        let topMargin: CGFloat = screenHeight*0.1
//        let witdhPlayer: CGFloat = screenHeight*0.18
//        let heightButton: CGFloat = screenHeight*0.08
//        let margin: CGFloat = 20
//        let witdhContentView: CGFloat = screenHeight*0.4
//        let marginPlayer: CGFloat = 16
//
//
//        happyLb.sizeToFit()
//        sadLb.sizeToFit()
//        angryLb.sizeToFit()
//        afraidLb.sizeToFit()
//
//        happyView.frame = CGRect(x: margin, y: topMargin, width: witdhContentView, height: witdhContentView)
//        sadView.frame = CGRect(x: screenWidth - margin - witdhContentView, y: happyView.y, width: witdhContentView, height: witdhContentView)
//        angryView.frame = CGRect(x: margin, y: screenHeight - margin - witdhContentView, width: witdhContentView, height: witdhContentView)
//        afraidView.frame = CGRect(x: screenWidth - margin - witdhContentView, y: angryView.y, width: witdhContentView, height: witdhContentView)
//        happyLb.frame = CGRect(x: happyView.width/2 - happyLb.width/2, y: happyView.height/2 - happyLb.height/2, width: happyLb.width, height: happyLb.height)
//        sadLb.frame = CGRect(x: sadView.width/2 - sadLb.width/2, y: sadView.height/2 - sadLb.height/2, width: sadLb.width, height: sadLb.height)
//        angryLb.frame = CGRect(x: angryView.width/2 - angryLb.width/2, y: angryView.height/2 - angryLb.height/2, width: angryLb.width, height: angryLb.height)
//        afraidLb.frame = CGRect(x: afraidView.width/2 - afraidLb.width/2, y: afraidView.height/2 - afraidLb.height/2, width: afraidLb.width, height: afraidLb.height)
//
//        let widthButton: CGFloat = (afraidView.x - margin) - ( angryView.maxX + margin)
//        replayBtn.frame = CGRect(x: angryView.maxX + margin, y: screenHeight - margin - heightButton, width: widthButton, height: heightButton)
//
//        playerImg1.frame = CGRect(x: happyView.maxX + margin*2, y: topMargin, width: witdhPlayer, height: witdhPlayer)
//        playerImg3.frame = CGRect(x: playerImg1.x, y: playerImg1.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)
//        playerImg5.frame = CGRect(x: playerImg1.x, y: playerImg3.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)
//        playerImg7.frame = CGRect(x: playerImg1.x, y: playerImg5.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)
//
//        playerImg2.frame = CGRect(x: sadView.x - witdhPlayer - margin*2, y: topMargin, width: witdhPlayer, height: witdhPlayer)
//        playerImg4.frame = CGRect(x: playerImg2.x, y: playerImg2.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)
//        playerImg6.frame = CGRect(x: playerImg2.x, y: playerImg4.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)
//        playerImg8.frame = CGRect(x: playerImg2.x, y: playerImg6.maxY + marginPlayer, width: witdhPlayer, height: witdhPlayer)

    }
}
