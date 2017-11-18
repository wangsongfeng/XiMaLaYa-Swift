//
//  XMFindCellBottomView.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
class XMFindCellBottomView: UIView {
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect.init(x: 0, y: 0, width: imageW, height: imageW)
        imageView.image = UIImage.init(named: "find_usercover")
        
        return imageView
    }()
    
    lazy var Titles: UILabel = {
       let title = UILabel()
        title.font = UIFont.systemFont(ofSize: MatchW(W: 13))
        title.numberOfLines = 2
        title.text = "王松锋，人生自古谁无死，留取丹心照汗青"
        return title
    }()
    
    lazy var littleImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage.init(named: "find_specialicon")
        return imageView
    }()
    
    lazy var littleLable: UILabel = {
       let lable = UILabel()
        lable.text = "这就是生活"
        lable.font = UIFont.systemFont(ofSize: MatchW(W: 12))
        
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(self.imageView)
        setUIFrame()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension XMFindCellBottomView{
    func setUIFrame() -> Void {
        self.addSubview(self.Titles)
        self.Titles.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(self.imageView.snp.bottom).offset(MatchW(W: 10))
            make.height.equalTo(MatchW(W: 35))
        }
        
        self.addSubview(self.littleImageView)
        self.littleImageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(self.Titles.snp.bottom).offset(MatchW(W: 10))
            make.width.height.equalTo(MatchW(W: 10))
        }
        
        self.addSubview(self.littleLable)
        self.littleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.littleImageView.snp.right).offset(MatchW(W: 2))
            make.centerY.equalTo(self.littleImageView)
            make.right.equalTo(0)
            make.height.equalTo(MatchW(W: 12))
        }
    }
}
