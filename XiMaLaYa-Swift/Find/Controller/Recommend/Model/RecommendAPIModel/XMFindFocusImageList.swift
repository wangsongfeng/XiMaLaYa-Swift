//
//  XMFindFocusImageList.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
class XMFindFocusImageList: HandyJSON {

    var uid: Int = 0
    
    var shortTitle: String?
    
    var ID: Int = 0
    
    var pic: String?
    
    var albumId: Int = 0
    
    var isShare: Bool = false
    
    var is_External_url: Bool = false
    
    var type: Int = 0
    
    var longTitle: String?
    
    required init() {
        
    }
}
