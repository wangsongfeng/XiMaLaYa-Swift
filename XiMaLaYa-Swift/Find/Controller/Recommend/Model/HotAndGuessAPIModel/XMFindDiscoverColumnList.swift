//
//  XMFindDiscoverColumnList.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
class XMFindDiscoverColumnList: HandyJSON {

    var subtitle: String?
    
    var coverPath: String?
    
    var contentType: String?
    
    var title: String?
    
    var enableShare: Bool = false
    
    var isExternalUrl: Bool = false
    
    var properties: XMFindDiscoveProperties?
    
    var sharePic: String?
    
    var url: String?
    
    required init() {
        
    }
}
