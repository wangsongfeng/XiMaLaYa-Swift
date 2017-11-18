//
//  XMFindRecViewModel.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
class XMFindRecViewModel: NSObject {

    //小编推荐
    var editorAlbum : XMFindEditorRecoAlbum!
//    轮播图
    var focusImages : XMFindFocusImages!
    //精品听单
    var special: XMFindSpecialColumn!
    //分类
    var discoverColumns: XMFindDiscoverColumns!
    //猜你喜欢
    var guess:XMFindGuess!
    //听北京
    var cityColumns: XMFindCityColumns!
    //热门推荐
    var hotRecommends: XMFindHotRecommend!
    //现场直播
    var liveList: Array<XMFindLive?> = []
    
    
    //轮播图数组
    var focusImagesPics : [String] = [String]()
    //分类数组
    var headerCategorys: [XMFindDiscoverColumnList] = [XMFindDiscoverColumnList]()
    
    // MARK:- 数据更新回调
    typealias AddBlock = () -> Void
    var updataBlock : AddBlock?
    
}
//加载数据
extension XMFindRecViewModel {
    func refreshDataSource() -> Void {
        
        XMFindAPI.requestRecommends { (result, error) in
            guard !(error != nil) else {
                print("出错了")
                return
            }
            let json = JSON(result as Any)
            
            //小编推荐
            let editorRecAlbum = JSONDeserializer<XMFindEditorRecoAlbum>.deserializeFrom(json: json["editorRecommendAlbums"].description)
            //轮播图
            let focusImages = JSONDeserializer<XMFindFocusImages>.deserializeFrom(json: json["focusImages"].description)
            //精品听单
            let special = JSONDeserializer<XMFindSpecialColumn>.deserializeFrom(json: json["specialColumn"].description)
            
            
            self.editorAlbum = editorRecAlbum
            self.focusImages = focusImages
            self.special = special
            
            if let focusImgsList = self.focusImages.list{
                for item in focusImgsList {
                    self.focusImagesPics.append(item.pic!)
                }
            }
            
            self.updataBlock?()
            
        }
        
        
        
        
        XMFindAPI.requestHotAndGuess { (result, error) in
            guard !(error != nil) else {
                print("出错了")
                return
            }
            let json = JSON(result as Any)
            //分类            
            let discoverColumns = JSONDeserializer<XMFindDiscoverColumns>.deserializeFrom(json: json["discoveryColumns"].description)
            //猜你喜欢
            let guess = JSONDeserializer<XMFindGuess>.deserializeFrom(json: json["guess"].description)
            //听北京
            let cityColumns = JSONDeserializer<XMFindCityColumns>.deserializeFrom(json: json["cityColumn"].description)
            //热门推荐
            let hotRecommends = JSONDeserializer<XMFindHotRecommend>.deserializeFrom(json: json["hotRecommends"].description)
            
            self.discoverColumns = discoverColumns
            self.guess = guess
            self.cityColumns = cityColumns
            self.hotRecommends = hotRecommends
            
            if let discoverColumnsList = discoverColumns?.list {
                self.headerCategorys = discoverColumnsList
                
            }
            
            self.updataBlock?()
         }
        
        XMFindAPI.requestLiveRecommend { (result, error) in
            guard !(error != nil) else {
                print("出错了")
                return
            }
            let json = JSON(result as Any)

            if let liveArray = JSONDeserializer<XMFindLive>.deserializeModelArrayFrom(json: json["data"].description){
                self.liveList = liveArray
            }
            self.updataBlock?()
        }
    }

}

// MARK:- 各section的高度
let kSectionHeight: CGFloat        = MatchW(W: 116) + imageW
let kSectionLiveHeight: CGFloat    = MatchW(W: 215)
let kSectionSpecialHeight: CGFloat = 219.0
let kSectionMoreHeight: CGFloat    = MatchW(W: 60)
//ViewModel赋值
extension XMFindRecViewModel {
    func numberOfSections() -> NSInteger {
        return 8
    }
    func numberOfItemInSection(section : NSInteger) -> NSInteger {
        switch section {
        case kFindSectionEditCommen:
            return 1
        case kFindSectionLive :
            return liveList.count == 0 ? 0 : 1
        case kFindSectionGuess :
            guard (guess != nil) else { return 0 }
            return guess.list?.count == 0 ? 0 : 1
        case kFindSectionCityColumn:    // 城市歌单
            guard (cityColumns != nil) else { return 0 }
            return cityColumns.list?.count == 0 ? 0 : 1
        case kFindSectionSpecial:       // 精品听单
            guard (special != nil) else { return 0 }
            return special.list?.count == 0 ? 0 : 1
        case kFindSectionAdvertise:     // 推广
            return 0    // 暂时未找到接口
        case kFindSectionHotCommends:   // 热门推荐
            guard (hotRecommends != nil) else { return 0 }
            return (hotRecommends.list?.count)!
        case kFindSectionMore:          // 更多分类
            return 1
        default:
            return 0
        }
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case kFindSectionEditCommen:    // 小编推荐
            return kSectionHeight
        case kFindSectionLive:          // 现场直播
            return liveList.count == 0 ? 0 : kSectionLiveHeight
        case kFindSectionGuess:         // 猜你喜欢
            guard (guess != nil) else { return 0 }
            return guess.list?.count == 0 ? 0 : kSectionHeight
        case kFindSectionCityColumn:    // 城市歌单
            guard (cityColumns != nil) else { return 0 }
            return cityColumns.list?.count == 0 ? 0 : kSectionHeight
        case kFindSectionSpecial:       // 精品听单
            guard (special != nil) else { return 0 }
            return special.list?.count == 0 ? 0 : kSectionSpecialHeight
        case kFindSectionAdvertise:     // 推广
            return 0    // 暂时未找到接口
        case kFindSectionHotCommends:   // 热门推荐
            return kSectionHeight
        case kFindSectionMore:          // 更多分类
            return kSectionMoreHeight
        default:
            return 0
        }
    }
}
