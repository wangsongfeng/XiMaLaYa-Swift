//
//  XMFindFeeDetailModel.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import HandyJSON
class XMFindFeeDetailModel: HandyJSON {

    var title:String?
    var tags : String?
    var serialState : Int = 0
    var nickname: String?
    var coverMiddle: String?
    var playsCounts: Int = 0
    var intro: String?
    var isPaid: Bool = false
    var commentsCount: Int = 0
    var albumId: Int = 0
    var ID: Int = 0
    var coverSmall: String?
    var coverLarge: String?
    var uid: Int = 0
    var tracks: Int = 0
    var priceTypeId: Int = 0
    var isFinished: Int = 0
    var trackId: Int = 0
    var provider: String?
    var albumCoverUrl1290: String?

    required init() {
        
    }
}
