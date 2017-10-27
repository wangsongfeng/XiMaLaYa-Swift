//
//  BaseNavigationController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/26.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.isNavigationBarHidden = true
        //点击播放按钮的通知
        NotificationCenter.default.addObserver(self, selector: #selector(hidePlayView), name: NSNotification.Name(rawValue: "hidePlayView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showPlayView), name: NSNotification.Name(rawValue: "showPlayView"), object: nil)

        //通知播放 播放按钮 图片
        NotificationCenter.default.addObserver(self, selector: #selector(playingWithInfoDictionary), name: NSNotification.Name(rawValue: "BeginPlay"), object: nil)
        
        self.view.addSubview(playView)
       
     }
    lazy var playView : NaPlayView = {
       let playView = NaPlayView.init(frame: CGRect.init(x: view.frame.size.width/2-65/2, y: view.frame.size.height-70, width: 65, height: 70))
        playView.delegate = self

        return playView
    }()

}
extension BaseNavigationController : playButtonClickDelegate{
    @objc func hidePlayView(notifation: NSNotification) -> Void {
        playView.isHidden = true
    }
    
    @objc func showPlayView(notifation : Notification) -> Void {
        playView.isHidden = false
    }
    
    @objc func playingWithInfoDictionary(notifation: Notification) -> Void {
//        let coverURL = notifation.userInfo!["coverURL"]
//        let musicURL = notifation.userInfo!["musicURL"]
//        playView.contentImageView.image = UIImage.init(data: Data.init(contentsOf: coverURL as! URL))
//        print(musicURL)
        
    }
    
    func playButtonClickWithSelector(selected: Bool) {
        
    }
}
