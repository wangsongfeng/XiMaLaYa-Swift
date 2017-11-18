//
//  XMFindRecommendList.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
//热门推荐
class XMFindRecommendList: HandyJSON {

    var hsaMore: Bool = false
    var isPaid:Bool = false
    var contentType: String?
    var title: String?
    var isFinished:Bool = false
    var categoryId: Int = 0
    var count: Int = 0
    var list: [XMFindFeeDetailModel]?
    var categoryType: Int = 0
    var filterSupported: Bool = false
    
    required init(){}
}
