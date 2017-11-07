//
//  XMFindAPI.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
//小编推荐-轮播图-精品听单
fileprivate let RecommendAPI = "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"
//分类-猜你喜欢-听北京-热门推荐
fileprivate let HotAndGuessAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21"
//现场直播
fileprivate let LiveRecommendAPI = "http://live.ximalaya.com/live-activity-web/v3/activity/recommend"
//footerAD
fileprivate let recomBannerAPI = "http://adse.ximalaya.com/ting?appid=0&device=iPhone&name=find_banner&network=WIFI&operator=3&scale=2&version=5.4.21"

class XMFindAPI: NSObject {
//小编推荐-轮播图-精品听单
    class func requestRecommends(finished:@escaping (_ result : AnyObject?,_ error: NSError?)->()){
        NetWorkTools.shareInstance.requestData(methodType: .GET, url: RecommendAPI, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
    
    //分类-猜你喜欢-听北京-热门推荐
   class  func requestHotAndGuess(finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) -> Void {
        NetWorkTools.shareInstance.requestData(methodType: .GET, url: HotAndGuessAPI, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
    //现场直播
   class  func requestLiveRecommend(finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) -> Void {
        NetWorkTools.shareInstance.requestData(methodType: .GET, url: LiveRecommendAPI, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
    
    //footerAD
   class func requestFooter(finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()) -> Void {
        NetWorkTools.shareInstance.requestData(methodType: .GET, url: recomBannerAPI, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
}
