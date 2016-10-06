//
//  SecondViewController.swift
//  weather
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 数据源
    var dataArr = NSMutableArray()
    let tableView = UITableView()
    var page:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "开心一笑"
        self.view.backgroundColor = UIColor.blueColor()
        self.loadData()
        self.makeUI()
    }
    // MARK: - 网络请求
    func loadData() -> Void {
        HDManager.startLoading()
        let url = "http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text"
        let httpArg = "page=\(self.page)"
        JokeTextModel.requestJokeData(url, httpArg: httpArg) { (jokeData, error) in
            if error == nil{
                if self.page == 1{
                    self.dataArr.removeAllObjects()
                }
                for model in jokeData!{
                    self.dataArr.addObject(model)
                }
                self.tableView.reloadData()
            }
            HDManager.stopLoading()
            self.tableView.header.endRefreshing()
            self.tableView.footer.endRefreshing()
        }
        
    }
    
    // MARK: - 展示数据
    func makeUI() ->Void {
        self.tableView.frame = CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49)
        tableView.registerNib(UINib.init(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.estimatedRowHeight = 100 //预设行高
        tableView.header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.page = 1
            // 重新加载
            self.loadData()
        })
        tableView.footer = MJRefreshAutoFooter.init(refreshingBlock: {
            self.page += 1
            // 重新加载
            self.loadData()
        })
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCellWithIdentifier("JokeCell", forIndexPath: indexPath) as! JokeCell
        let model = self.dataArr[indexPath.row] as! JokeTextModel
        cell.titleL.text = model.title
        cell.textL.text = "    " + model.text
        cell.timeL.text = model.ct
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}








