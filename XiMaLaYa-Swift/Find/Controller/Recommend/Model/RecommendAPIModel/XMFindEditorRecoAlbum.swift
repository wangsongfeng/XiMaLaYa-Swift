//
//  XMFindEditorRecoAlbum.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
//小编推荐
class XMFindEditorRecoAlbum: HandyJSON {

    var title: String?
    
    var list: [XMFindFeeDetailModel]?
    
    var hasMore: Bool  = false
    
    var ret: Int = 0
    
    required init() {
        
    }
    
}

