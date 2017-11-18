//
//  XMFindCellStyleFeeCell.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
class XMFindCellStyleFeeCell: UITableViewCell {
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
    
    // MARK : 模型数据
    //小编推荐
    var recommendModel: XMFindEditorRecoAlbum? {
        didSet{
            setRecommendModel()
        }
    }
    //城市模型
    var cityColumnModel: XMFindCityColumns? {
        didSet{
            setCityColumnModel()
        }
    }
    //猜你喜欢
    var guessModel: XMFindGuess? {
        didSet{
            setGuessModel()
        }
    }
    //热门推荐
    var hotRecommendList: XMFindRecommendList? {
        didSet{
            setHotRecommendList()
        }
    }
    
    //三个View
    var LMRView : XMFindCellBottomView = XMFindCellBottomView()
    
    lazy var lmrViewOne: XMFindCellBottomView = {
       let view = XMFindCellBottomView()
        self.addSubview(view)
        
        view.snp.makeConstraints({ (make) in
            make.left.equalTo(Space+(imageW+midSpace) * CGFloat(0))
            make.top.equalTo(self.Title.snp.bottom).offset(MatchW(W: 10))
            make.bottom.equalTo(-MatchW(W: Space))
            make.width.equalTo(imageW)
        })
        
        return view
    }()
    
    lazy var lmrViewTwo: XMFindCellBottomView = {
        let view = XMFindCellBottomView()
        self.addSubview(view)
        
        view.snp.makeConstraints({ (make) in
            make.left.equalTo(Space+(imageW+midSpace) * CGFloat(1))
            make.top.equalTo(self.Title.snp.bottom).offset(MatchW(W: 10))
            make.bottom.equalTo(-MatchW(W: Space))
            make.width.equalTo(imageW)
        })
        return view
    }()
    
    lazy var lmrViewThree: XMFindCellBottomView = {
        let view = XMFindCellBottomView()
        self.addSubview(view)
        
        view.snp.makeConstraints({ (make) in
            make.left.equalTo(Space+(imageW+midSpace) * CGFloat(2))
            make.top.equalTo(self.Title.snp.bottom).offset(MatchW(W: 10))
            make.bottom.equalTo(-MatchW(W: Space))
            make.width.equalTo(imageW)
        })
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
}

//懒加载控件
extension XMFindCellStyleFeeCell {
    func setBottonViewFrame() -> Void {
       
    }
   
}

//设置上方控件frame
extension XMFindCellStyleFeeCell {
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
    }
}


//开始赋值数据
extension XMFindCellStyleFeeCell{
    func setRecommendModel() -> Void {
        setUIFrame()
        guard (recommendModel != nil) else {return}
        Title.text = recommendModel?.title
        setSubDetailsWith(list: (recommendModel?.list)!)
    }
    func setCityColumnModel() -> Void {
        setUIFrame()

        guard cityColumnModel != nil else {return}
        Title.text = cityColumnModel?.title
        setSubDetailsWith(list: (cityColumnModel?.list)!)
    }
    
    func setGuessModel() -> Void
    {
        setUIFrame()

        guard guessModel != nil else {return}
        Title.text = guessModel?.title
        setSubDetailsWith(list: (guessModel?.list)!)
    }
    func setHotRecommendList() -> Void {
        setUIFrame()
        guard hotRecommendList != nil else{return}
        Title.text = hotRecommendList?.title
        setSubDetailsWith(list: (hotRecommendList?.list)!)
    }
    
    func setSubDetailsWith(list:[XMFindFeeDetailModel]) -> Void {
       
     
            let model = list[0]
            let model1 = list[1]
            let model2 = list[2]
        
            let picUrl = URL(string: model.coverLarge ?? "")
            let picUrl1 = URL(string: model1.coverLarge ?? "")
            let picUrl2 = URL(string: model2.coverLarge ?? "")
            self.lmrViewOne.imageView.sd_setImage(with: picUrl)
            self.lmrViewOne.Titles.text = model.intro
            self.lmrViewOne.littleLable.text = model.title

        self.lmrViewTwo.imageView.sd_setImage(with: picUrl1)
        self.lmrViewTwo.Titles.text = model1.intro
        self.lmrViewTwo.littleLable.text = model1.title
        
        self.lmrViewThree.imageView.sd_setImage(with: picUrl2)
        self.lmrViewThree.Titles.text = model2.intro
        self.lmrViewThree.littleLable.text = model2.title
    }
    
}
