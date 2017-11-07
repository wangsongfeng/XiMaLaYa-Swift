//
//  XMFindHeaderIconView.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage
class XMFindHeaderIconView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    
    var model : XMFindDiscoverColumnList! {
        didSet{
            setupDetailModel()
        }
    }
    
    
    //创建视图
    class func newInstance() -> XMFindHeaderIconView? {
        let nibView = Bundle.main.loadNibNamed("XMFindHeaderIconView", owner: nil, options: nil)
        
        if let view = nibView?.first as? XMFindHeaderIconView {
            return view
        }
        return nil
        
    }
}

extension XMFindHeaderIconView {
    func setupDetailModel() -> Void {
        
        imageView.layer.cornerRadius = 45/2.0
        imageView.layer.masksToBounds = true
        guard let title = model.title else {return}
        textLable.text = title
        guard let imagUrl = model.coverPath else {return}
        imageView.sd_setImage(with: NSURL.init(string: imagUrl)! as URL)
    }
}
