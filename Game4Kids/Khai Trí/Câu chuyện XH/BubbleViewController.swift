//
//  BubbleViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/26/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

let theWidth:CGFloat = UIScreen.main.bounds.width
let theHeight:CGFloat = UIScreen.main.bounds.height

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    let length = Int64(range.upperBound - range.lowerBound + 1)
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    return T(value)
}

extension Collection {
    func randomItem() -> Self.Iterator.Element {
        let count = distance(from: startIndex, to: endIndex)
        let roll = randomNumber(inRange: 0...count-1)
        return self[index(startIndex, offsetBy: roll)]
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

extension UIImage {
    
    func randomImage() -> UIImage {
        var randomList = ["ball1", "ball2", "ball3", "ball4", "ball5"]
        let rd = arc4random_uniform(5)
        
        return UIImage(named: randomList[Int(rd)]) ?? UIImage()
    }
    
    func randomRemoveImage() -> UIImage {
        var randomList = ["kt1", "kt2", "kt3", "kt4", "kt5"]
        let rd = arc4random_uniform(5)
        
        return UIImage(named: randomList[Int(rd)]) ?? UIImage()
    }
}

extension CGFloat {
    
    func randomPosision(min: Int, max: Int) -> CGFloat {
        
        let rd = randomNumber(inRange: min ... max)
        return CGFloat(rd)
    }
}

class BubbleViewController: UIViewController {
    
    @IBOutlet private weak var lblTimer:UILabel?
    @IBOutlet weak var lblScore: UILabel!
    
    let imageSize = CGSize(width: 60, height: 60)
    var arrImage:[UIImageView] = [UIImageView]()
//    weak var delegate:ViewControllerDelegate?
    
    var player : AVAudioPlayer?
    var countMiss:Int = 0
    
    var timer:Timer?
    var currentTime = 60 {
        didSet {
            self.lblTimer?.text = "\(currentTime)"
        }
    }
    
    var score:Int = 0 {
        didSet {
            print("score-------", score)
            lblScore.text = "Điểm: \(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.startGame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "BONG BÓNG"
    }
    
    private func setupView() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.actionTouch(recognizer:)))
        self.view.addGestureRecognizer(tapGesture)
        self.view.isUserInteractionEnabled = true
        
//        if isHasMusic {
//            self.playSound()
//        }
    }
    
    func startGame() {
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        
        self.currentTime -= 1
        
        if self.currentTime % 2 == 0 {
            self.initBongBong()
        }
        
        if self.currentTime <= 0 {
            self.stopTime()
        }
    }
    
//    fileprivate func detectHighScore() {
//
//        if let score = UserDefaults().value(forKey: kHighScoreUserDefault) as? Int {
//            if score <= self.score {
//                UserDefaults().set(self.score, forKey: kHighScoreUserDefault)
//            }
//        } else {
//            UserDefaults().set(self.score, forKey: kHighScoreUserDefault)
//        }
//    }
}

extension BubbleViewController {
    func initBongBong() {
        
        let xImg:CGFloat = CGFloat().randomPosision(min: 30, max: Int(theWidth - 30))
        let yImg:CGFloat = theHeight
        
        let imgBongBong = UIImageView(frame: CGRect(x: xImg, y: yImg, width: imageSize.width, height: imageSize.height))
        imgBongBong.image = UIImage().randomImage()
        imgBongBong.contentMode = .scaleAspectFit
        self.view.addSubview(imgBongBong)
        
        self.arrImage.append(imgBongBong)
        
        UIView.animate(withDuration: 7
            , animations: {
                imgBongBong.frame.origin.y = 0
        }, completion: {finished in
            self.countMiss += 1
            
        })
        
    }
    
    @objc func actionTouch(recognizer: UITapGestureRecognizer) {
        
        if let position:CGPoint = recognizer.location(in: self.view) {
            
            for index in 0 ..< self.arrImage.count {
                
                if (self.arrImage[index].layer.presentation()?.frame.origin.x ?? 0) < position.x
                    && (self.arrImage[index].layer.presentation()?.frame.origin.x ?? 0) + imageSize.width > position.x
                    && (self.arrImage[index].layer.presentation()?.frame.origin.y ?? 0) < position.y
                    && (self.arrImage[index].layer.presentation()?.frame.origin.y ?? 0) + imageSize.height > position.y {
                    
                    self.arrImage[index].removeFromSuperview()
                    self.score += 1
                    self.arrImage.remove(at: index)
                    
                    self.initMonster(position: position)
                    return
                }
            }
        }
    }
    
    private func initMonster(position: CGPoint) {
        
        let imgBongBong = UIImageView(frame: CGRect(x: position.x - 30, y: position.y, width: imageSize.width, height: imageSize.height))
        imgBongBong.image = UIImage().randomRemoveImage()
        imgBongBong.contentMode = .scaleAspectFit
        self.view.addSubview(imgBongBong)
        
        UIView.animate(withDuration: 0.5
            , animations: {
                imgBongBong.frame.origin.y = position.y - 30
        }, completion: {finished in
            imgBongBong.removeFromSuperview()
        })
    }
}

extension BubbleViewController {
    
    @IBAction func actionExit(sender: UIButton) {
        self.stopTime()
    }
    
    func stopTime() {
        
//        self.detectHighScore()
//        self.delegate?.didEndGame()
        self.timer?.invalidate()
        self.timer = nil
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

extension BubbleViewController {
    
    func playSound() {
        
        let path = Bundle.main.path(forResource: "happy", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
}
