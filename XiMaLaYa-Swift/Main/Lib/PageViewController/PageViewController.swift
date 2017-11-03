//
//  PageViewController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
//代理
protocol PageViewControlerDelegate : NSObjectProtocol {
    func PageViewControllerIndex(index : NSInteger, pageViewController: PageViewController)
}
class PageViewController: UIViewController {

    weak var delegate : PageViewControlerDelegate?
    //所有子控制器
    var controllers : [UIViewController] = [UIViewController]()
    //父控制器
    var superController : UIViewController!
    var pageVC : UIPageViewController!
    
    init(superController: UIViewController, controllers : [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        self.controllers = controllers
        self.superController = superController
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }

}
//向外提供方法，当标题按钮点击时，视图运动
extension PageViewController {
    func setCurrentSubControllerWith(index : NSInteger) -> Void {
        pageVC.setViewControllers([controllers[index]], direction: .forward, animated: false, completion: nil)
    }
}
extension PageViewController {
    fileprivate func setup() {
        if controllers.count==0 {
            return
        }
        
        let options : [String : Any] = [UIPageViewControllerOptionSpineLocationKey : NSNumber.init(integerLiteral: UIPageViewControllerSpineLocation.none.rawValue)]
        let page = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
        page.delegate = self
        page.dataSource = self
        page.setViewControllers([controllers.first!], direction: .forward, animated: false, completion: nil)
        page.view.frame = self.view.frame
        pageVC = page
        self.view.addSubview(page.view)
        
    }
}

extension PageViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    //前一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        if index == 0 || index == NSNotFound {
            return nil
        }
        return controllers[index-1]
    }
    
    //下一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else {
            return nil
        }
        if index == NSNotFound || index == controllers.count-1 {
            return nil
        }
        
        return controllers[index+1]
    }
    //返回控制器的数量
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    //跳到下一个控制器的时调用
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let vc = pageViewController.viewControllers?[0] else {
            return
        }
        let index = indexForViewController(controller: vc)
        delegate?.PageViewControllerIndex(index: index, pageViewController: self)
    }
    //获得当前控制器的角标
    func indexForViewController(controller : UIViewController) -> NSInteger {
        return controllers.index(of: controller)!
    }
}
