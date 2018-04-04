//
//  BanTeViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/22/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class BanTeViewController: BaseViewController {

    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var replayButton: UIButton!
    
    let checkImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "tick")
        imgView.isHidden = true
        return imgView
    }()
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    var typeView = TypeViewCoDung.DiXeDap
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutImg(typeView: typeView.rawValue)
//        layout()
//        arrOrigin = getPos()
//        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
//        setPosition(arrData: data)
        rightButton.addSubview(checkImg)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        checkImg.frame = CGRect(x: rightButton.width-50, y: 0, width: 50, height: 50)
    }
    
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(wrongButton.frame.origin)
        arr.append(rightButton.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        wrongButton.frame.origin = arrData[0]
        rightButton.frame.origin = arrData[1]
        originPlayer1 = wrongButton.center
        originPlayer2 = rightButton.center
    }
    
    func layoutImg(typeView: String) {
        switch typeView {
        case TypeViewCoDung.DiXeDap.rawValue:
            image1.image = #imageLiteral(resourceName: "dixedap1")
            image2.image = #imageLiteral(resourceName: "dixedap2")
            image3.image = #imageLiteral(resourceName: "dixedap3")
            wrongButton.setImage(#imageLiteral(resourceName: "answer1_dixedap"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "answer2_dixedap"), for: .normal)
        case TypeViewCoDung.ChoDenLuot.rawValue:
            image1.image = #imageLiteral(resourceName: "chodenluot1")
            image2.image = #imageLiteral(resourceName: "chodenluot2")
            image3.image = #imageLiteral(resourceName: "chodenluot3")
            wrongButton.setImage(#imageLiteral(resourceName: "anwser1_chodenluot"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "answer2_chodenluot"), for: .normal)
        case TypeViewCoDung.VanTruot.rawValue:
            image1.image = #imageLiteral(resourceName: "vantruot1")
            image2.image = #imageLiteral(resourceName: "vantruot2")
            image3.image = #imageLiteral(resourceName: "vantruot3")
            wrongButton.setImage(#imageLiteral(resourceName: "answer1_ vantruot"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "answer2_ vantruot"), for: .normal)
        case TypeViewCoDung.DaBong.rawValue:
            image1.image = #imageLiteral(resourceName: "dabong1")
            image2.image = #imageLiteral(resourceName: "dabong2")
            image3.image = #imageLiteral(resourceName: "dabong3")
            wrongButton.setImage(#imageLiteral(resourceName: "false_answer_dabong"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "true_answer_dabong"), for: .normal)
            
        case TypeViewCoDung.ChiaSeBanh.rawValue:
            image1.image = #imageLiteral(resourceName: "sandwich1")
            image2.image = #imageLiteral(resourceName: "sandwich2")
            image3.image = #imageLiteral(resourceName: "sandwich3")
            wrongButton.setImage(#imageLiteral(resourceName: "answer1_sandwich"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "answer2_sandwich"), for: .normal)
            
        case TypeViewCoDung.CauTruot.rawValue:
            image1.image = #imageLiteral(resourceName: "cautruot1")
            image2.image = #imageLiteral(resourceName: "cautruot2")
            image3.image = #imageLiteral(resourceName: "cautruot3")
            wrongButton.setImage(#imageLiteral(resourceName: "cautruot_answer1"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "cautruot_answer2"), for: .normal)
        case TypeViewCoDung.BongRo.rawValue:
            image1.image = #imageLiteral(resourceName: "luanphien1")
            image2.image = #imageLiteral(resourceName: "luanphien2")
            image3.image = #imageLiteral(resourceName: "luanphien3")
            wrongButton.setImage(#imageLiteral(resourceName: "answer1_bongro"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "answer2_bongro"), for: .normal)
        default:
            break
        }
    }
    
    func layout() {
        let centexX: CGFloat = self.view.width/2
        let hBtn: CGFloat = self.replayButton.y - 16 - contentStackView.maxY - 16
        wrongButton.frame = CGRect(x: centexX - 16 - hBtn, y: contentStackView.maxY + 16, width: hBtn, height: hBtn)
        rightButton.frame = CGRect(x: wrongButton.maxX + 32, y: wrongButton.y, width: hBtn, height: hBtn)
    }

    @IBAction func rightBtnDidTap(_ sender: Any) {
        playSound(name: "Correct", Extension: "mp3", repeatSound: false)
        checkImg.isHidden = false
    }
    @IBAction func wrongBtnDidTap(_ sender: Any) {
        playSound(name: "Wrong", Extension: "mp3", repeatSound: false)
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        checkImg.isHidden = true
    }
}
