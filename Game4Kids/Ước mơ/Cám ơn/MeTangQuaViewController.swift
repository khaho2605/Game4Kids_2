//
//  MeTangQuaViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/9/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

enum TypeView: String {
    case MeTangQua = "MeTangQua"
    case BanChiaSeDoChoi = "BanChiaSeDoChoi"
    case BeGiupMe = "BeGiupMe"
    case CoGiaoKhen = "CoGiaoKhen"
    case DuocQuaSinhNhat = "DuocQuaSinhNhat"
}

class MeTangQuaViewController: BaseViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var typeView = TypeView.MeTangQua
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: typeView.rawValue)
    }
    
    func updateUI(with typeView: String) {
        switch typeView {
        case TypeView.MeTangQua.rawValue:
            detailImage.image = #imageLiteral(resourceName: "manhinh1")
            detailLabel.text = "Khi được mẹ tặng quà nhân ngày sinh nhật"
        case TypeView.BanChiaSeDoChoi.rawValue:
            detailImage.image = #imageLiteral(resourceName: "manhinh2")
            detailLabel.text = "Khi được bạn chia sẽ đồ chơi"
        case TypeView.BeGiupMe.rawValue:
            detailImage.image = #imageLiteral(resourceName: "manhinh3")
            detailLabel.text = "Bé vui vẻ giúp đỡ mẹ công việc nhà"
        case TypeView.CoGiaoKhen.rawValue:
            detailImage.image = #imageLiteral(resourceName: "manhinh4")
            detailLabel.text = "Cô giáo khen ngợi khi bé chăm ngoan nghe lời cô"
        case TypeView.DuocQuaSinhNhat.rawValue:
            detailImage.image = #imageLiteral(resourceName: "manhinh5")
            detailLabel.text = "Được tặng quà nhân ngày sinh nhật"
        default:
            break
        }
    }
}
