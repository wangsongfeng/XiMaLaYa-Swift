//
//  XMFindCityColumns.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
//听北京
class XMFindCityColumns: HandyJSON {

    var code: String?
    var title: String?
    var count: Int = 0
    var list: [XMFindFeeDetailModel]?
    var hasMore: Bool = false
    var contentType: String?
    
    
   required init() {}
}
