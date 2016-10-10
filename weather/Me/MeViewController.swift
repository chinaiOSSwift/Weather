//
//  MeViewController.swift
//  weather
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 qianfeng. All rights reserved.
/*
 白羊座3.21-4.19 ----Aries
 金牛座4.20-5.20----- Taurus
 双子座5.21-6.21----- Gemini
 巨蟹座6.22-7.22 ----Cancer
 狮子座7.23-8.22---- Leo
 处女座8.23-9.22 ----Virgo
 天var座9.23-10.23 -----Libra
 天蝎座10.24-11.21 ----Scorpio
 人马座11.22-12.20---- Sagittarius
 山羊座12.21-1.20----- Capricorn
 水瓶座1.21-2.19----- Aquarius
 双鱼座 2.20-3.20 ------Pisces
 */

import UIKit

class MeViewController: UIViewController {
    
    
    let dataArr:[String] = ["白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","人马座","山羊座","水瓶座","双鱼座"]
    var preSelected:NSInteger = 0
    var todayModel:LuckModel?
    var tomorrowModel:LuckModel?
    var thisWeek:weekModel?
    var nextWeek:weekModel?
    var monthModel:MonthModel?
    var constellation:String = "白羊座" // 星座
    var type = "today"
    let titleView = UIView()
    let slider = UILabel()
    let NavLeftView = UIView()
    //    let consNameL = UILabel()
    var tableViewHidden:Bool = true // 默认隐藏
    
    // 星座列表
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRectMake(20, 64, 100, 350))
        tableView.backgroundColor = UIColor.clearColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.view.addSubview(tableView)
        return tableView
    }()
    // MARK: - 内容展示模块
    lazy var contentView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let collectionvView = UICollectionView.init(frame: CGRectMake(0, 64 + 37, SCREEN_W, SCREEN_H - 64 - 49 - 37), collectionViewLayout: layout)
        collectionvView.bounces = false
        collectionvView.showsHorizontalScrollIndicator = false
        collectionvView.pagingEnabled = true
        collectionvView.backgroundColor = contentColor
        collectionvView.delegate = self
        collectionvView.dataSource = self
        collectionvView.userInteractionEnabled = true
        collectionvView.registerNib(UINib.init(nibName: "TodayOrTomorrowCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TodayOrTomorrowCellCollectionViewCell")
        collectionvView.registerNib(UINib.init(nibName: "WeekCell", bundle: nil), forCellWithReuseIdentifier: "WeekCell")
        collectionvView.registerClass(MonthModelCell.self, forCellWithReuseIdentifier: "MonthModelCell")
        self.view.addSubview(collectionvView)
        return collectionvView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.userInteractionEnabled = true
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "星座运势"
        self.view.backgroundColor = UIColor.whiteColor()
        self.makeNavLeft()
        self.makeUI()
    }
    
    // MARK: - 即将显示
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    // MARK: - 制作导航栏左视图
    func makeNavLeft() -> Void{
        NavLeftView.frame = CGRectMake(0, 0, 100, 44)
        NavLeftView.userInteractionEnabled = true
        NavLeftView.backgroundColor = UIColor.clearColor()
        let btn = UIButton.init(frame: CGRectMake(0, 14, NavLeftView.mj_w, 30))
        btn.backgroundColor = contentColor
        btn.addTarget(self, action: #selector(self.leftClickHandle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitle(self.constellation, forState: UIControlState.Normal)
        btn.setTitle(self.constellation, forState: UIControlState.Highlighted)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 15
        btn.tag = 1010
        NavLeftView.addSubview(btn)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: NavLeftView)
    }
    // MARK: - 左视图点击事件
    func leftClickHandle(tap:UITapGestureRecognizer) -> Void {
        self.view.bringSubviewToFront(self.tableView)
        if tableViewHidden {
            self.tableView.reloadData()
            self.tableViewHidden = false
        }else{
            self.tableViewHidden = true
        }
        self.tableView.hidden = self.tableViewHidden
    }
    
    
    // MARK: - 制作界面
    func makeUI() -> Void{
        self.titleView.frame = CGRectMake(0, 64, SCREEN_W, 37)
        titleView.backgroundColor = UIColor.clearColor()
        let titles = ["今日","明日","本周","下周","本月"]
        let btn_W = SCREEN_W / CGFloat(titles.count)
        for i in 0..<titles.count{
            let frame = CGRectMake(btn_W * CGFloat(i), 0, btn_W, 35)
            let btn = UIButton.init(type: UIButtonType.Custom)
            btn.frame = frame
            btn.setTitle(titles[i], forState: UIControlState.Normal)
            btn.setTitle(titles[i], forState: UIControlState.Highlighted)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
            btn.setTitleColor(contentColor, forState: UIControlState.Selected)
            btn.backgroundColor = UIColor.init(white: 0.3, alpha: 0.3)
            btn.addTarget(self, action: #selector(self.btnClickHandle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = 1000 + i
            if btn.tag == 1000{
                btn.selected = true
            }
            titleView.addSubview(btn)
        }
        self.slider.frame = CGRectMake(0, 35, btn_W, 2)
        self.slider.backgroundColor = contentColor
        titleView.addSubview(slider)
        self.view.addSubview(titleView)
    }
    
    
    
    // MARK: - 按钮的点击事件
    func btnClickHandle(button:UIButton) -> Void{
        
        UIView.animateWithDuration(0.25) {
            (self.titleView.viewWithTag(self.preSelected + 1000) as! UIButton).selected = false
            button.selected = true
            self.slider.mj_x = button.mj_x
        }
        self.preSelected = button.tag - 1000
        
        // 设置偏移量
        self.contentView.setContentOffset(CGPointMake(SCREEN_W * CGFloat(self.preSelected), 0), animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 网络加载
    func loadData(){
        self.type = "today"
        // 加载今天数据
        let url = "http://apis.baidu.com/bbtapi/constellation/constellation_query"
        var httpArg = ("consName=\(self.constellation)&type=\(self.type)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())
        
        HDManager.startLoading()
        LuckModel.requestData(url, httpArg: httpArg!) { (model, error) in
            if error == nil{
                self.todayModel = model
            }else{
                print(error)
            }
            self.contentView.reloadData()
            HDManager.stopLoading()
            
        }
        
        // 加载明天数据
        self.type =  "tomorrow"
        httpArg = ("consName=\(self.constellation)&type=\(self.type)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())
        HDManager.startLoading()
        LuckModel.requestData(url, httpArg: httpArg!) { (model, error) in
            if error == nil{
                self.tomorrowModel = model
            }
            self.contentView.reloadData()
            HDManager.stopLoading()
            
        }
        // 加载本周数组
        self.type = "week"
        httpArg = ("consName=\(self.constellation)&type=\(self.type)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())
        HDManager.startLoading()
        weekModel.requestData(url, httpArg: httpArg!) { (model, error) in
            if error == nil{
                self.thisWeek = model
            }
            self.contentView.reloadData()
            HDManager.stopLoading()
            
        }
        
        // 加载下周数据
        self.type = "nextweek"
        httpArg = ("consName=\(self.constellation)&type=\(self.type)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())
        HDManager.startLoading()
        weekModel.requestData(url, httpArg: httpArg!) { (model, error) in
            if error == nil{
                self.nextWeek = model
            }
            self.contentView.reloadData()
            HDManager.stopLoading()
        }
        // 加载本月数据
        self.type = "month"
        httpArg = ("consName=\(self.constellation)&type=\(self.type)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())
        HDManager.startLoading()
        MonthModel.requestData(url, httpArg: httpArg!) { (model, error) in
            if error == nil{
                self.monthModel = model
            }
            self.contentView.reloadData()
            HDManager.stopLoading()
            
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.contentView.reloadData()
    }
    
    
}

extension MeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 应该网络请求
        self.constellation = self.dataArr[indexPath.row]
        //        print("应该请求:\(self.constellation)")
        (self.NavLeftView.viewWithTag(1010) as! UIButton).setTitle(self.dataArr[indexPath.row], forState: UIControlState.Normal)
        (self.NavLeftView.viewWithTag(1010) as! UIButton).setTitle(self.dataArr[indexPath.row], forState: UIControlState.Highlighted)
        self.tableView.hidden = true
        self.tableViewHidden = true
        // 网络请求
        self.loadData()
        self.contentView.reloadData()
    }
    
}

extension MeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cellID = ""
        if indexPath.item == 0{
            cellID = "TodayOrTomorrowCellCollectionViewCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! TodayOrTomorrowCellCollectionViewCell
            cell.customWithModel(self.todayModel)
            return cell
        }else if indexPath.item == 1{
            cellID = "TodayOrTomorrowCellCollectionViewCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! TodayOrTomorrowCellCollectionViewCell
            
            cell.customWithModel(self.tomorrowModel)
            
            return cell
        }else if indexPath.item == 2{
            cellID = "WeekCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! WeekCell
            cell.customWithModel(self.thisWeek)
            return cell
        }else if indexPath.item == 3{
            cellID = "WeekCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! WeekCell
            cell.customWithModel(self.nextWeek)
            return cell
        }else{
            cellID = "MonthModelCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! MonthModelCell
            if self.monthModel != nil{
                cell.customCellWithModel(self.monthModel!)
            }
            return cell
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.mj_w, collectionView.mj_h)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index:NSInteger = Int(scrollView.contentOffset.x / SCREEN_W)
        UIView.animateWithDuration(0.25) {
            (self.titleView.viewWithTag(self.preSelected + 1000) as! UIButton).selected = false
            (self.titleView.viewWithTag(index + 1000) as! UIButton).selected  = true
            self.slider.mj_x = (self.titleView.viewWithTag(index + 1000) as! UIButton).mj_x
        }
        self.preSelected = index
    }
}









