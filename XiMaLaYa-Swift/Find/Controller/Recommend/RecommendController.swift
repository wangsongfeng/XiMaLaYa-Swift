//
//  RecommendController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class RecommendController: UIViewController {

    lazy var viewModel : XMFindRecViewModel = {
       return XMFindRecViewModel()
    }()
    
    lazy var header: XMFindRecHeaderView = {
       
        let header = XMFindRecHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: 250))
        return header
    }()
    
//    tableView懒加载
    lazy var tableView: UITableView = {
       let tableView = UITableView.init(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableHeaderView = self.header
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updataBlock =  { [unowned self] in
            
            self.tableView.reloadData()
            self.header.focusImgPics = self.viewModel.focusImagesPics
            self.header.categoryModelArr = self.viewModel.headerCategorys
        }
        viewModel.refreshDataSource()
        
    }
}
//tableView代理
extension RecommendController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
}
