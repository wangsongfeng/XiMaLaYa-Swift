//
//  FindViewController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/27.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nextVC = NextViewController()
        nextVC.hidesBottomBarWhenPushed = true;
        self.navigationController?.navigationBar.isHidden = true;
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
