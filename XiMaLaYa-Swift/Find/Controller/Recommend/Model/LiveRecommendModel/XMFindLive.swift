//
//  XMFindLive.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
class XMFindLive: HandyJSON {

    var ID: Int = 0
    
    var onlineCount: Int = 0
    
    var endTs: Int = 0
    
    var remainMs: Int = 0
    
    var playCount: Int = 0
    
    var shortDescription: String?
    
    var startTs: Int = 0
    
    var scheduleId: Int = 0
    
    var chatId: Int = 0
    
    var coverPath: String?
    
    var name: String?
    
    var status: Int = 0
    
    required init(){}
}
