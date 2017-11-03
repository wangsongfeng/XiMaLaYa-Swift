//
//  XMSubFindFactory.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

enum XMSubFindType {
    case XMSubFindTypeRecommend
    case XMSubFindTypeCategory
    case XMSubFindTypeRadio
    case XMSubFindTypeRand
    case XMSubFindTypeAnchor
    case XMSubFindTypeUnkown
}

class XMSubFindFactory: NSObject {

    class func subFindVCWith(identifier : String)->UIViewController {
        let subFindType : XMSubFindType = typeFromTitle(title: identifier)
        let controller : UIViewController!
        
        switch subFindType {
        case .XMSubFindTypeRecommend:
            controller = RecommendController()
        case .XMSubFindTypeCategory:
            controller = CategoryController()
        case .XMSubFindTypeRadio:
            controller = RadioController()
        case .XMSubFindTypeRand:
            controller = RandController()
        case .XMSubFindTypeAnchor:
            controller = AnchorController()
        default:
            controller = UIViewController()
        }
        
        return controller
        
    }
    
    private class func typeFromTitle(title : String)->XMSubFindType{
        if title == "推荐" {
            return .XMSubFindTypeRecommend
        }else if title == "分类" {
            return .XMSubFindTypeCategory
        }else if title == "广播" {
            return .XMSubFindTypeRadio
        }else if title == "榜单" {
            return .XMSubFindTypeRand
        }else if title == "主播" {
            return .XMSubFindTypeAnchor
        }else {
            return .XMSubFindTypeUnkown
        }
    }
}
