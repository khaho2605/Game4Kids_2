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
    
    var arrOrigin: [CGPoint]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        arrOrigin = getPos()
        setPosition(arrData: arrOrigin?.randomArr(arrSource: arrOrigin!) as! [CGPoint])
        
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView1)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView2)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView3)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView4)))
        playerImg5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView5)))
        playerImg6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragView6)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        setPosition(arrData: arrOrigin?.randomArr(arrSource: arrOrigin!) as! [CGPoint])
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        playerImg5.isUserInteractionEnabled = true
        playerImg6.isUserInteractionEnabled = true
    }
    
}

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
    func dragView1(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg1, posPlayer: originPlayer1!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg1.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func dragView2(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg2, posPlayer: originPlayer2!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg2.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func dragView3(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg3, posPlayer: originPlayer3!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg3.isUserInteractionEnabled = false
                endTouch = false
            }
        }

    }
    
    func dragView4(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg4, posPlayer: originPlayer4!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg4.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func dragView5(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg5, posPlayer: originPlayer5!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg5.isUserInteractionEnabled = false
                endTouch = false
            }
        }

    }
    
    func dragView6(recognizer:UIPanGestureRecognizer){
        dragView(recognizer: recognizer, target: targetImg6, posPlayer: originPlayer6!)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerImg6.isUserInteractionEnabled = false
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
            
//            _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.playDongVai), userInfo: nil, repeats: false);
        }
    }
}

extension BrushTeethViewController {
    func layout() {
        let screenHeight: CGFloat = self.view.frame.height
        let screenWidth: CGFloat = self.view.frame.width
        let topMargin: CGFloat = screenHeight*0.22
        let witdhPlayer: CGFloat = screenHeight*0.2
        let heightPlayer: CGFloat = witdhPlayer
        
        let topMarginTarget: CGFloat = screenHeight*0.2
        let witdhTarget: CGFloat = screenHeight*0.23
        let heightTarget: CGFloat = witdhTarget
        
        let widthButton: CGFloat = screenWidth*0.2
        let heightButton: CGFloat = screenHeight*0.26
        
        playerImg3.frame = CGRect(x: 0, y: topMargin, width: witdhPlayer, height: heightPlayer)
        playerImg3.center = CGPoint(x: self.view.center.x-witdhPlayer/2, y: playerImg3.frame.origin.y)
        
        playerImg2.frame = CGRect(x: playerImg3.frame.origin.x-10-witdhPlayer, y: playerImg3.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg1.frame = CGRect(x: playerImg2.frame.origin.x-10-witdhPlayer, y: playerImg3.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        
        
        playerImg4.frame = CGRect(x: playerImg3.frame.maxX+10, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg5.frame = CGRect(x: playerImg4.frame.maxX+10, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        playerImg6.frame = CGRect(x: playerImg5.frame.maxX+10, y: playerImg1.frame.origin.y, width: witdhPlayer, height: heightPlayer)
        
        playerImg1.layer.cornerRadius = 5
        playerImg2.layer.cornerRadius = 5
        playerImg3.layer.cornerRadius = 5
        playerImg4.layer.cornerRadius = 5
        playerImg5.layer.cornerRadius = 5
        playerImg6.layer.cornerRadius = 5
        
        
        targetImg2.frame = CGRect(x: 0, y: playerImg1.frame.maxY+topMarginTarget, width: witdhTarget, height: heightTarget)
        targetImg2.center = CGPoint(x: self.view.center.x, y: targetImg2.frame.origin.y)
        targetImg1.frame = CGRect(x: targetImg2.frame.origin.x-10-witdhTarget, y: targetImg2.frame.origin.y, width: witdhTarget, height: heightTarget)
        
        targetImg3.frame = CGRect(x: targetImg2.frame.maxX+10, y: targetImg2.frame.origin.y, width: witdhTarget, height: heightTarget)
        targetImg4.frame = CGRect(x: targetImg1.frame.origin.x, y: targetImg1.frame.maxY+10, width: witdhTarget, height: heightTarget)
        targetImg5.frame = CGRect(x: targetImg4.frame.maxX+10, y: targetImg4.frame.origin.y, width: witdhTarget, height: heightTarget)
        targetImg6.frame = CGRect(x: targetImg5.frame.maxX+10, y: targetImg4.frame.origin.y, width: witdhTarget, height: heightTarget)
        
        replayBtn.frame = CGRect(x: targetImg6.frame.maxX+20, y: targetImg6.frame.origin.y, width: widthButton, height: heightButton)
        replayBtn.layer.cornerRadius = 10
        replayBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
