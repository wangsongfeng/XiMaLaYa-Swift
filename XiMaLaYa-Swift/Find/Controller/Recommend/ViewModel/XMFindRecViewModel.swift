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
            self.discoverColumns = discoverColumns
            if let discoverColumnsList = discoverColumns?.list {
                self.headerCategorys = discoverColumnsList
                
            }
            
            self.updataBlock?()
         }
    }

}
