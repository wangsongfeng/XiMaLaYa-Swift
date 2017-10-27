//
//  NaPlayView.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/24.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SnapKit

protocol playButtonClickDelegate {
    func playButtonClickWithSelector(selected: Bool)
}

class NaPlayView: UIView {

    var myContext = 0
    var delegate : playButtonClickDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backGroundTV = UIImageView()
        backGroundTV.layoutIfNeeded()

        backGroundTV.frame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        print(frame.size.width)
        backGroundTV.image = UIImage.init(named: "tabbar_np_normal")
        
        self.addSubview(backGroundTV)
        
        backGroundTV.addSubview(circleIV)

        
        circleIV.addSubview(self.contentImageView)
        self.addSubview(playButton)
        playButton.setImage(UIImage.init(named: "tabbar_np_play"), for: .normal)
        
        
        setFrame()
    }
    func setFrame() -> Void {
        contentImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(8, 8, 8, 8))
        }
        playButton.snp.makeConstraints { (make) in
            make.left.top.equalTo(2)
            make.right.equalTo(-2)
            make.bottom.equalTo(-7)
        }
        playButton.addTarget(self, action: #selector(playButtonDidClick), for: .touchUpInside)
        //注册KVC 监听image 的变化
        contentImageView.addObserver(self, forKeyPath: "image", options: .new, context: &myContext)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var circleIV : UIImageView = {
       let circleIV = UIImageView()
        circleIV.image = UIImage.init(named: "tabbar_np_loop")
        circleIV.frame = CGRect.init(x: 2, y: 2, width: self.frame.size.width-4, height: self.frame.size.height-10)
        return circleIV
    }()
    //懒加载 点击播放后的图片
    lazy var contentImageView : UIImageView = {
       
        let contentImageView = UIImageView()
        contentImageView.layer.cornerRadius = 22
        contentImageView.clipsToBounds = true
        
        return contentImageView
    }()
    
    //懒加载定时器
    private lazy var link: CADisplayLink = {
        let link = CADisplayLink.init(target: self, selector: #selector(rotation))
        link.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
        return link
    }()
    //定时器事件
    @objc func rotation() -> Void {
        circleIV.layer.transform  = CATransform3DRotate(circleIV.layer.transform, CGFloat((72/60.0)/180 * M_PI), 0, 0, 1)
    }
    
    //懒加载 点击按钮
    private lazy var playButton : UIButton = {
       let playButton = UIButton()
        playButton.isHighlighted = true
        playButton.setBackgroundImage(UIImage.init(named: "avatar_bg"), for: .selected)
        playButton.setImage(UIImage.init(named: "toolbar_pause_h_p"), for: .selected)
        return playButton
    }()
    
    
    //按钮点击事件
    @objc func playButtonDidClick(button: UIButton) -> Void {
        button.isSelected = !button.isSelected
        link.isPaused = !button.isSelected
        delegate?.playButtonClickWithSelector(selected: button.isSelected)
    }

    deinit {
        contentImageView.removeObserver(self, forKeyPath: "image")
    }
}

extension NaPlayView {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            if let newValue = change?[NSKeyValueChangeKey.newKey]
            {
                link.isPaused = false
                playButton.isSelected = true
                print("\(newValue)")
            }
        }
    }
}
