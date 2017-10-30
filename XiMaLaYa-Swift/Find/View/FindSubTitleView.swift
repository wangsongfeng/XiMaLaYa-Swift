//
//  FindSubTitleView.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/29.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

let SystemOriginColor = UIColor.init(red: 0.96, green: 0.39, blue: 0.26, alpha: 1.0)
let SystemBlackColor = UIColor.init(red: 0.38, green: 0.39, blue: 0.40, alpha: 1.0)
protocol FindSubTitleViewDelegate : NSObjectProtocol {
    
    func findSubTitleViewDidSelected(titleView : FindSubTitleView, atIndex : NSInteger, title: String)
}
class FindSubTitleView: UIView {
    //MARK 代理
    weak var delegate : FindSubTitleViewDelegate?
    var subTitleBtnArray : [UIButton] = [UIButton]()
    var currentSelectedBtn : UIButton!
    
    var titleArray : [String] = [] {
        didSet{
            configSubTitles()
        }
    }
    //懒加载 下方滑块
    lazy var sliderView : UIView = {
       let view = UIView()
        view.backgroundColor = SystemOriginColor
        self.addSubview(view)
        view.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 2))
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(5)
        })
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.white
    }

}
//在下面视图滑动时，标题栏也跟着滑动的方法

extension FindSubTitleView {
    func jumpShow(atIndex: NSInteger) -> Void {
        if atIndex < 0 || atIndex >= subTitleBtnArray.count {
            return
        }
        let btn = subTitleBtnArray[atIndex]
        selectedAtButton(btn: btn, isFirstStart: false)
    }
}
//MARK  配置标题按钮
extension FindSubTitleView {
    fileprivate func configSubTitles() {
        //每一个按钮的宽度
        let btnW = ScreenW / CGFloat(titleArray.count)
        
        for index in 0..<titleArray.count {
            let title = titleArray[index]
            let btn = UIButton.init(type: .custom)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(SystemBlackColor, for: .normal)
            btn.setTitleColor(SystemOriginColor, for: .selected)
            btn.setTitleColor(SystemOriginColor, for: [.highlighted,.normal])
            btn.frame = CGRect.init(x: CGFloat(index) * btnW, y: 0, width: btnW, height: 38)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.adjustsImageWhenDisabled = false
            btn.addTarget(self, action: #selector(subTitleClick), for:.touchUpInside)
            subTitleBtnArray.append(btn)
            addSubview(btn)
        }
        guard let firstBtn = subTitleBtnArray.first else {
            return
        }
        selectedAtButton(btn: firstBtn, isFirstStart: true)
    }
    
    //当前选中某个按钮
    fileprivate func selectedAtButton(btn : UIButton, isFirstStart: Bool){
        btn.isSelected = true
        currentSelectedBtn = btn
        sliderView.snp.updateConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(btn.x+btn.width * 0.5 - 15)
        }
        if !isFirstStart {
            UIView.animate(withDuration: 0.25, animations: {
                self.layoutIfNeeded()
            })
        }
        unSelectedAllBtn(btn: btn)
    }
    
    //对所有没有选中的按钮执行反操作
    fileprivate func unSelectedAllBtn(btn : UIButton) {
        for sbtn in subTitleBtnArray {
            if sbtn == btn {
                continue
            }
            sbtn.isSelected = false
        }
    }
}
//事件监听
extension FindSubTitleView {
    @objc func subTitleClick(btn : UIButton) -> Void {
        if btn == currentSelectedBtn {
            return
        }
        
        delegate?.findSubTitleViewDidSelected(titleView: self, atIndex: subTitleBtnArray.index(of: btn)!, title: (btn.titleLabel?.text)!)
        selectedAtButton(btn: btn, isFirstStart: false)
    }
}
