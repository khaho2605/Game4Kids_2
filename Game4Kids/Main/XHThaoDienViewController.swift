//
//  XHThaoDienViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/16/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class XHThaoDienViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func coiAoBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "CoiAo", bundle: nil).instantiateViewController(withIdentifier: "CoiAo") as? CoiAoViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func macAoBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "MacAo", bundle: nil).instantiateViewController(withIdentifier: "MacAo") as? MacAoViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func coiQuanBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "CoiQuan", bundle: nil).instantiateViewController(withIdentifier: "CoiQuan") as? CoiQuanViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func macQuanBtnDidTap(_ sender: Any) {
        if let viewController = UIStoryboard(name: "MacQuan", bundle: nil).instantiateViewController(withIdentifier: "MacQuan") as? MacQuanViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
