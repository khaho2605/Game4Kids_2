//
//  ChamSocViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/7/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class ChamSocViewController: BaseViewController {

    @IBOutlet weak var shirtView: UIView!
    @IBOutlet weak var shirtLb: UILabel!
    @IBOutlet weak var pantsView: UIView!
    @IBOutlet weak var pantsLb: UILabel!
    
    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()

    let arrImg = [#imageLiteral(resourceName: "AoNam1"), #imageLiteral(resourceName: "AoNam2"), #imageLiteral(resourceName: "AoNam3"), #imageLiteral(resourceName: "AoNu1"), #imageLiteral(resourceName: "AoNu2"), #imageLiteral(resourceName: "AoNu3"), #imageLiteral(resourceName: "QuanNam1"), #imageLiteral(resourceName: "QuanNam2"), #imageLiteral(resourceName: "QuanNam3"),#imageLiteral(resourceName: "QuanNu1"), #imageLiteral(resourceName: "QuanNu2"), #imageLiteral(resourceName: "QuanNu3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOrigin = getPos()
        setPosition(arrData: arrOrigin)
        randomImg(arrImg: arrImg)
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "CHĂM SÓC BẢN THÂN"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        setPosition(arrData: arrOrigin)
        randomImg(arrImg: arrImg)
    }

    @IBAction func replayBtnDidTap(_ sender: Any) {
        setPosition(arrData: arrOrigin)
        randomImg(arrImg: arrImg)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
    }
    
    func randomImg(arrImg: [UIImage]) {
        if arrImg.count >= 3 {
            guard let data = arrImg.randomArr() as? [UIImage]  else { return }
            playerImg1.image = data[0]
            playerImg2.image = data[1]
            playerImg3.image = data[2]
        }
    }
    
    func getTargetView(with imageView: UIImageView) -> UIView {
        var view = UIView()
        switch imageView.image {
        case #imageLiteral(resourceName: "AoNam1")?, #imageLiteral(resourceName: "AoNam2")?, #imageLiteral(resourceName: "AoNam3")?, #imageLiteral(resourceName: "AoNu1")?, #imageLiteral(resourceName: "AoNu2")?, #imageLiteral(resourceName: "AoNu3")?:
            view = shirtView
        case #imageLiteral(resourceName: "QuanNam1")?, #imageLiteral(resourceName: "QuanNam2")?, #imageLiteral(resourceName: "QuanNam3")?, #imageLiteral(resourceName: "QuanNu1")?, #imageLiteral(resourceName: "QuanNu2")?, #imageLiteral(resourceName: "QuanNu3")?:
            view = pantsView
        default:
            break
        }
        return view
    }
    
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
    
    func actionDragView(recognizer: UIPanGestureRecognizer) {
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? -1
        let playerView = recognizer.view
        
        let targetView = getTargetView(with: recognizer.view as! UIImageView)

        switch tagView {
        case 1:
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            posOrigin = originPlayer2 ?? CGPoint.zero
        case 3:
            posOrigin = originPlayer3 ?? CGPoint.zero
        default:
            break
        }
        dragViewRandom2(recognizer: recognizer, target: targetView, posPlayer: posOrigin, framePlayer: (playerView?.frame)!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerView?.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 3 {
            print("Game is finish---------")
//            playSound(name: "be that gioi", Extension: "wav")
        }
    }
    
    func layout() {
        shirtLb.sizeToFit()
        pantsLb.sizeToFit()
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.1
        let wTarget: CGFloat = screenWidth*0.75
        let hTarget: CGFloat = screenHeight*0.2
        let marginPlayer: CGFloat = 40
        let hButton: CGFloat = screenHeight*0.08
        let wButton: CGFloat = screenWidth*0.4
        let wPlayer: CGFloat = screenHeight*0.22
        let marginLb: CGFloat = 8

        shirtView.frame = CGRect(x: shirtLb.maxX + 32, y: topMargin, width: wTarget, height: hTarget)
        shirtLb.frame = CGRect(x: shirtView.x - shirtLb.width - marginLb, y: shirtView.maxY - shirtLb.height, width: shirtLb.width, height: shirtLb.height)
        pantsView.frame = CGRect(x: shirtView.x, y: shirtView.maxY+32, width: wTarget, height: hTarget)
        pantsLb.frame = CGRect(x: pantsView.x - pantsLb.width - marginLb, y: pantsView.maxY - pantsLb.height, width: pantsLb.width, height: pantsLb.height)

        let posX: CGFloat = screenWidth/2 - wPlayer/2
        playerImg2.frame = CGRect(x: posX, y: pantsView.maxY + marginPlayer, width: wPlayer, height: wPlayer)
        playerImg1.frame = CGRect(x: playerImg2.x - marginPlayer - wPlayer, y: playerImg2.y, width: wPlayer, height: wPlayer)
        playerImg3.frame = CGRect(x: playerImg2.maxX + marginPlayer, y: playerImg2.y, width: wPlayer, height: wPlayer)

        replayBtn.layer.cornerRadius = 8
        replayBtn.frame = CGRect(x: screenWidth/2 - wButton/2, y: screenHeight - 32 - hButton, width: wButton, height: hButton)
    }
}
