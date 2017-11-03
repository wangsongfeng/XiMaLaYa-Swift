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
    //子控制器
    lazy var controllers: [UIViewController] = {
        var conts : [UIViewController] = [UIViewController]()
        for title in self.subTitleArray {
            let con = XMSubFindFactory.subFindVCWith(identifier: title)
            conts.append(con)
        }
        return conts
    }()
    lazy var pageVC : PageViewController = {
        let pageVC = PageViewController.init(superController: self, controllers: self.controllers)
        pageVC.delegate = self
        self.view.addSubview(pageVC.view)
        return pageVC
    }()
    //头部标题
    lazy var subTitleView : FindSubTitleView = {
       let view = FindSubTitleView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenW, height: 40))
        self.view.addSubview(view)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        subTitleView.delegate = self
        subTitleView.titleArray = subTitleArray
        
        contentSubView()
    }
}
//page的位置
extension FindViewController {
    func contentSubView() -> Void {
        pageVC.view.snp.makeConstraints { (make) in

            make.top.equalTo(subTitleView.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}
//标题视图按钮点击了，，控制器移动
extension FindViewController : FindSubTitleViewDelegate {
    func findSubTitleViewDidSelected(titleView: FindSubTitleView, atIndex: NSInteger, title: String) {
        pageVC.setCurrentSubControllerWith(index: atIndex)
    }
}
//pageController的代理，滑动结束 得到角标 ，让按钮滑动
extension FindViewController : PageViewControlerDelegate {
    func PageViewControllerIndex(index: NSInteger, pageViewController: PageViewController) {
        subTitleView.jumpShow(atIndex: index)
    }
}
