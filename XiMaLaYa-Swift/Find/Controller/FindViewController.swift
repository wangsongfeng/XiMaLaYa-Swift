//
//  FindViewController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/27.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    lazy var subTitleArray:[String] = {
       return ["推荐","分类","广播","榜单","主播"]
    }()
    
    //头部标题
    lazy var subTitleView : FindSubTitleView = {
       let view = FindSubTitleView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenW, height: 40))
        self.view.addSubview(view)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        subTitleView.titleArray = subTitleArray
    }
}
