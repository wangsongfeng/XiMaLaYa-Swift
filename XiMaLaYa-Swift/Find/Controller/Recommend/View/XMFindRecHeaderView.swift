//
//  XMFindRecHeaderView.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDCycleScrollView

let cycleViewH: CGFloat = 150
let cateIconW: Double = 71
let cateIconH: Double = 90

class XMFindRecHeaderView: UIView {

    var adverScrollView: UIView = UIView()//装载轮播图的View
    var cateScrollView: UIScrollView = UIScrollView()//下方滑动按钮图
    
    var focusImgPics: [String]!{
        didSet{
            setupCycleView()
        }
    }
    
    var categoryModelArr : [XMFindDiscoverColumnList]!{
        didSet{
            setupCategory()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.adverScrollView.frame = CGRect.init(x: 0, y: 0, width: ScreenW, height: cycleViewH)
        
        self.cateScrollView.frame = CGRect.init(x: 0, y: cycleViewH, width: ScreenW, height: CGFloat(cateIconH))
        addSubview(self.adverScrollView)
        addSubview(self.cateScrollView)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//轮播图
extension XMFindRecHeaderView{
    func setupCycleView() -> Void {
        if let cycleView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: cycleViewH), delegate: self as SDCycleScrollViewDelegate, placeholderImage: nil) {
            cycleView.showPageControl = false
            cycleView.imageURLStringsGroup = self.focusImgPics
            adverScrollView.addSubview(cycleView)
            
        }
        
    }
    
    func setupCategory() -> Void {
        let count: Double = Double(categoryModelArr.count)
        print(count)
        if count==0 {
            return
        }
        
        cateScrollView.contentSize = CGSize.init(width: cateIconW * count, height: cateIconH)
        for index in 0..<categoryModelArr.count {
            let detailModel = categoryModelArr[index]
            if let iconView = XMFindHeaderIconView.newInstance(){
                iconView.frame = CGRect.init(x: Double(index) * cateIconW, y: 0, width: cateIconW, height: cateIconH)
                iconView.model = detailModel
                cateScrollView.addSubview(iconView)
            }
            
        }
    }
    
    
}
//轮播图的代理
extension XMFindRecHeaderView : SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击了第\(index+1)张图")
    }
}
