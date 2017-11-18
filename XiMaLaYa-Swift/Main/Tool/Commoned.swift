//
//  Commoned.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/29.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

import SnapKit

//屏幕宽度
let ScreenW = UIScreen.main.bounds.size.width
//屏幕高度
let ScreenH = UIScreen.main.bounds.size.height


func MatchW(W : CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.width/375.0 * W
}

func MatchH(H: CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.height/667.0 * H
}
let Space = MatchW(W: 12)
let midSpace = MatchW(W: 10)

let imageW = (ScreenW-(Space*2+midSpace*2.0))/3

