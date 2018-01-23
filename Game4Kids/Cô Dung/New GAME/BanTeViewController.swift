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
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    var typeView = TypeViewCoDung.BanTe
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutImg(typeView: typeView.rawValue)
//        layout()
//        arrOrigin = getPos()
//        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
//        setPosition(arrData: data)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
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
        case TypeViewCoDung.BanTe.rawValue:
            image1.image = #imageLiteral(resourceName: "bante1")
            image2.image = #imageLiteral(resourceName: "bante2")
            image3.image = #imageLiteral(resourceName: "bante3")
            wrongButton.setImage(#imageLiteral(resourceName: "bante_answers1"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "bante_answers2"), for: .normal)
        case TypeViewCoDung.BongRo.rawValue:
            image1.image = #imageLiteral(resourceName: "bongro1")
            image2.image = #imageLiteral(resourceName: "bongro2")
            image3.image = #imageLiteral(resourceName: "bongro3")
            wrongButton.setImage(#imageLiteral(resourceName: "bongro_answer1"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "bongro_answer2"), for: .normal)
        case TypeViewCoDung.CauTruot.rawValue:
            image1.image = #imageLiteral(resourceName: "cautruot1")
            image2.image = #imageLiteral(resourceName: "cautruot2")
            image3.image = #imageLiteral(resourceName: "cautruot3")
            wrongButton.setImage(#imageLiteral(resourceName: "cautruot_answer1"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "cautruot_answer2"), for: .normal)
        case TypeViewCoDung.LuanPhien.rawValue:
            image1.image = #imageLiteral(resourceName: "luanphien1")
            image2.image = #imageLiteral(resourceName: "luanphien2")
            image3.image = #imageLiteral(resourceName: "luanphien3")
            wrongButton.setImage(#imageLiteral(resourceName: "luanphien_answer1"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "luanphien_answer2"), for: .normal)
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
    }
    @IBAction func wrongBtnDidTap(_ sender: Any) {
        playSound(name: "Wrong", Extension: "mp3", repeatSound: false)
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
    }
}
