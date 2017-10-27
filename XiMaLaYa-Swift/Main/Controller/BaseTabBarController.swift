//
//  BaseTabBarController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/10/27.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    var string: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let findVC = FindViewController()
        let nav = UINavigationController.init(rootViewController: findVC)
        setupChildController(controller: nav, imageName: "tabbar_find_n", selectedImageName: "tabbar_find_h")
        
        let customController = CustomViewController()
        setupChildController(controller: customController, imageName: "tabbar_sound_n", selectedImageName: "tabbar_sound_h")
        let controller = UIViewController()
        
        setupChildController(controller: controller, imageName: "wang", selectedImageName: "string")
        let downController = DownLoadViewController()
        setupChildController(controller: downController, imageName: "tabbar_download_n", selectedImageName: "tabbar_download_h")
        
        let meControllr = MeViewController()
        setupChildController(controller: meControllr, imageName: "tabbar_me_n", selectedImageName: "tabbar_me_h")
        tabBar.backgroundImage = UIImage.init(named: "tabbar_bg")
        
    }

    func setupChildController(controller: UIViewController, imageName: String, selectedImageName: String) -> Void {
        controller.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        controller.tabBarItem.image = UIImage.init(named: imageName)
        
        let image = UIImage.init(named: selectedImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        controller.tabBarItem.selectedImage = image
        self.addChildViewController(controller)
    }
}
