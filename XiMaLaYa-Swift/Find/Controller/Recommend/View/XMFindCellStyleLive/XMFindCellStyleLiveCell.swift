//
//  XMFindCellStyleLiveCell.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 yangchao. All rights reserved.
//
//高度200
import UIKit
import SDCycleScrollView
class XMFindCellStyleLiveCell: UITableViewCell {

    var liveList: Array<XMFindLive?> = [] {
        didSet{
            setLiveList()
        }
    }
    var picUrls: [String] = [String]()
    
    //红色箭头
    lazy var findsection_icon : UIImageView = {
        let findsection_icon = UIImageView()
        findsection_icon.image = UIImage.init(named: "findsection_logo")
        return findsection_icon
    }()
    //标题
    lazy var Title: UILabel = {
        let title = UILabel()
        title.text = "付费精品"
        title.font = UIFont.systemFont(ofSize: MatchW(W: 15))
        
        return title
    }()
    
    //更多
    lazy var findsectionMore : UIImageView = {
        let findsectionMore = UIImageView()
        findsectionMore.image = UIImage.init(named: "liveRadioSectionMore_Normal")
        return findsectionMore
    }()
    
    lazy var scrollView : UIView = {
       let view = UIView()
        
        return view
    }()
    lazy var bottomOneLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines=1
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.text = "2016亚布力中国企业家论坛独家"
        return lable
    }()
    lazy var bottomTwoLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines=1
        lable.font = UIFont.systemFont(ofSize: 11)
        lable.text = "210.2万人参与"
        lable.textAlignment = NSTextAlignment.right
        return lable
    }()
    lazy var bottomThreeLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines=1
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.text = "值得一听！猴年开局中国企业家都谈了些啥"
        return lable
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   
}
extension XMFindCellStyleLiveCell{
    func setLiveList() -> Void {
        setUIFrame()
        _ = scrollView.subviews.map {
            $0.removeFromSuperview()
        }
        picUrls.removeAll()
        for item in liveList {
            picUrls.append(item?.coverPath ?? "")
        }
        guard let cycleView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: MatchW(W: 0), width: ScreenW-20, height: MatchW(W: 108)), delegate: self as SDCycleScrollViewDelegate, placeholderImage: nil) else {
            return
        }
        cycleView.pageControlStyle = SDCycleScrollViewPageContolStyleNone
        cycleView.imageURLStringsGroup = picUrls
        scrollView.addSubview(cycleView)
    }
}
extension XMFindCellStyleLiveCell: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        NSLog("你选中了第\(index)张")
    }
}
//设置上方控件frame
extension XMFindCellStyleLiveCell {
    func setUIFrame() -> Void {
        self.contentView.addSubview(self.findsection_icon)
        self.findsection_icon.snp.makeConstraints { (make) in
            make.left.equalTo(MatchW(W: 10))
            make.top.equalTo(MatchW(W: 15))
            make.width.equalTo(MatchW(W: 10))
            make.height.equalTo(MatchW(W: 10))
        }
        
        self.contentView.addSubview(self.Title)
        self.Title.snp.makeConstraints { (make) in        make.left.equalTo(self.findsection_icon.snp.right).offset(MatchW(W: 5))
            make.centerY.equalTo(self.findsection_icon)
            make.width.equalTo(MatchW(W: 140))
            make.height.equalTo(MatchW(W: 20))
        }
        
        self.contentView.addSubview(self.findsectionMore)
        self.findsectionMore.snp.makeConstraints { (make) in
            make.right.equalTo(-MatchW(W: 10))
            make.centerY.equalTo(self.findsection_icon)
            make.width.equalTo(MatchW(W: 34))
            make.height.equalTo(MatchW(W: 12))
        }
        
        self.contentView.addSubview(self.scrollView)
        self.scrollView.frame = CGRect.init(x: 10, y: MatchW(W: 43), width: ScreenW-20, height: MatchW(W: 108))
//        self.scrollView.snp.makeConstraints { (make) in
//            make.left.equalTo(10)
//            make.right.equalTo(-10)
//            make.top.equalTo(self.Title.snp.bottom).offset(MatchW(W: 13))
//            make.height.equalTo(MatchW(W: 108))
//        }
        self.contentView.addSubview(self.bottomOneLable)
        self.bottomOneLable.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-MatchW(W:150))
            make.top.equalTo(self.scrollView.snp.bottom).offset(MatchW(W: 14))
            make.height.equalTo(MatchW(W: 20))
        }
        self.contentView.addSubview(self.bottomTwoLable)
        self.bottomTwoLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.bottomOneLable.snp.right).offset(0)
            make.right.equalTo(-MatchW(W: 10))
            make.centerY.equalTo(self.bottomOneLable)
            make.height.equalTo(MatchW(W: 15))
            
        }
        
        self.contentView.addSubview(self.bottomThreeLable)
        self.bottomThreeLable.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(MatchW(W: 15))
            make.top.equalTo(self.bottomTwoLable.snp.bottom).offset(MatchW(W: 10))
            
        }
        
    }
}
