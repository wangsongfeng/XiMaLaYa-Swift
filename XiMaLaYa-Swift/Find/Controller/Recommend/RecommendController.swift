//
//  RecommendController.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

// MARK:- 各个section
let kFindSectionEditCommen  = 0     // 小编推荐
let kFindSectionLive        = 1     // 现场直播
let kFindSectionGuess       = 2     // 猜你喜欢
let kFindSectionCityColumn  = 3     // 城市歌单
let kFindSectionSpecial     = 4     // 精品听单
let kFindSectionAdvertise   = 5     // 推广
let kFindSectionHotCommends = 6     // 热门推荐
let kFindSectionMore        = 7     // 更多分类

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
       let tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableHeaderView = self.header
        self.view.addSubview(tableView)
        tableView.register(XMFindCellStyleFeeCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.register(XMFindCellStyleLiveCell.classForCoder(), forCellReuseIdentifier: "live")
        
            tableView.register(UINib.init(nibName: "LXFFindCellStyleSpecial", bundle: nil), forCellReuseIdentifier: "special")

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return viewModel.heightForRow(at: indexPath)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {  // 小编推荐
        case kFindSectionEditCommen:
            let editCommenCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? XMFindCellStyleFeeCell
            editCommenCell?.recommendModel = viewModel.editorAlbum
            editCommenCell?.selectionStyle = .none
//            editCommenCell?.delegate = self
            return editCommenCell!
        case kFindSectionLive:  // 现场直播
            if viewModel.liveList.count != 0 {
                let liveCell = tableView.dequeueReusableCell(withIdentifier: "live") as? XMFindCellStyleLiveCell
                liveCell?.selectionStyle = .none
//                liveCell?.setUIFrame()
                liveCell?.Title.text = "现场直播"

                liveCell?.liveList = viewModel.liveList
//                liveCell?.delegate = self
                return liveCell!
            }
            return UITableViewCell()
        case kFindSectionGuess: // 猜你喜欢
            guard (viewModel.guess != nil) else {
                return UITableViewCell()
            }
            if viewModel.guess.list?.count != 0 {
                let guessCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? XMFindCellStyleFeeCell
                guessCell?.selectionStyle = .none
                guessCell?.guessModel = viewModel.guess
                return guessCell!
            }
            return UITableViewCell()
        case kFindSectionCityColumn:    // 城市歌单
            guard viewModel.cityColumns != nil else {
                return UITableViewCell()
            }
            if viewModel.cityColumns.list?.count != 0 {
                let cityCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? XMFindCellStyleFeeCell
                cityCell?.selectionStyle = .none
                cityCell?.cityColumnModel = viewModel.cityColumns
                return cityCell!
            }
            return UITableViewCell()
        case kFindSectionSpecial:    // 精品听单
            guard viewModel.special == nil else {
                return UITableViewCell()
            }
            if viewModel.special.list?.count != 0 {
                let specialCell = tableView.dequeueReusableCell(withIdentifier: "special") as? LXFFindCellStyleSpecial
                specialCell?.selectionStyle = .none
                specialCell?.special = viewModel.special
//                specialCell?.delegate = self
                return specialCell!
            }
            return UITableViewCell()
        case kFindSectionAdvertise:    // 推广
            return UITableViewCell()    // 暂时未找到接口
        case kFindSectionHotCommends:    // 热门推荐
            let hotCommen = tableView.dequeueReusableCell(withIdentifier: "cell") as? XMFindCellStyleFeeCell
            hotCommen?.selectionStyle = .none
            if let hotRecList = viewModel.hotRecommends.list {
                hotCommen?.hotRecommendList = hotRecList[indexPath.row]
            }
            return hotCommen!
        case kFindSectionMore:    // 更多分类
            return UITableViewCell()
        default:    // 其它
            return UITableViewCell()
        }
    }
    
}
    

