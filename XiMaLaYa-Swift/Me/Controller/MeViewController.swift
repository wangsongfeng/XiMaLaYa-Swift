//
//  MeViewController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/27.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button : UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 70, height: 90))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(UIColor.black, for: .normal)
        button.set(image: UIImage.init(named: "tabbar_np_loop"), title: "旋转", titlePosition: .bottom, additionalSpacing: 10, state: .normal)
        view.addSubview(button)
        
        
    }
}
