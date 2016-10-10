//
//  ViewController.swift
//  weather
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 省: ["","","","","",""....]
    // 城市:[[cityModel,cityModel,cityModel,cityModel,cityModel...],[cityModel,cityModel,cityModel,cityModel,cityModel...],[cityModel,cityModel,cityModel,cityModel,cityModel...],[],[],[],[]...]
    
    let path = NSBundle.mainBundle().pathForResource("city.json", ofType: nil)
    
    // MARK: - 用来展示省的列表
    lazy var proView:ProvinceView = {
        let frame = CGRectMake(20, 64, 200, SCREEN_H - 300)
        let proView = ProvinceView.init(frame: frame)
        proView.delegate = self
        self.view.addSubview(proView)
        return proView
    }()
    
    // MARK: - 今天天气视图
    lazy var todayView:TodayView = {
        let todayView = TodayView.init(frame: CGRectMake(0, 64, 200, 160))
        self.view.addSubview(todayView)
        return todayView
    }()
    
    // MARK: - 生活指数
    lazy var leftIndexView:LifeIndexView = {
        let view = LifeIndexView.init(frame: CGRectMake(0, self.todayView.mj_h + self.todayView.mj_y + 5, SCREEN_W, (SCREEN_W / 4) * CGFloat(2) + 30))
        view.backgroundColor = UIColor.clearColor()
        view.delegate = self
        self.view.addSubview(view)
        return view
    }()
    
    // MARK: - 未来天气
    lazy var futureView:FutureView = {
        let future = FutureView.init(frame: CGRectMake(0, self.leftIndexView.mj_y + self.leftIndexView.mj_h + 5, SCREEN_W, 170))
        future.backgroundColor = UIColor.clearColor()
        self.view.addSubview(future)
        return future
    }()
    
    
    
    let leftView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.userInteractionEnabled = true
        //        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "backGround.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        self.view.backgroundColor = contentColor
        self.makeNAVLeftView()
    }
    
    // MARK: - 创建导航栏的左视图
    func makeNAVLeftView() -> Void {
        leftView.frame = CGRectMake(0, 0, 200, 44)
        leftView.backgroundColor = UIColor.clearColor()
        let proL = UILabel.init(frame: CGRectMake(0, 21, 75, 23))
        proL.userInteractionEnabled = true
        proL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        proL.text = "省"
        proL.tag = 1002
        proL.textColor = UIColor.whiteColor()
        proL.textAlignment = NSTextAlignment.Center
        proL.layer.masksToBounds = true
        proL.layer.cornerRadius = proL.mj_h / 2
        // 添加点击手势
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapHandle(_:)))
        proL.addGestureRecognizer(tap)
        leftView.addSubview(proL)
        
        let cityL = UILabel.init(frame: CGRectMake(proL.mj_x + proL.mj_w, proL.mj_h, proL.mj_w + 50, proL.mj_h))
        cityL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        cityL.text = "市区/直辖市"
        cityL.textColor = UIColor.whiteColor()
        cityL.textAlignment = NSTextAlignment.Center
        cityL.layer.masksToBounds = true
        cityL.tag = 1004
        cityL.layer.cornerRadius = cityL.mj_h / 2
        leftView.addSubview(cityL)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftView)
    }
    //MARK: - 点击省标签按钮时事件
    func tapHandle(tap:UITapGestureRecognizer) -> Void {
        self.loadData()
        UIView.animateWithDuration(0.25) {
            self.view.bringSubviewToFront(self.proView)
            self.proView.hidden = false
            //刷新
            (self.proView.viewWithTag(1001) as! UITableView).reloadData()
        }
    }
    
    //MARK: - 请求数据
    func loadData() -> Void {
        ProvinceModel.requestDataArrays(path!) { (proArray, cityArray) in
            // 在这里传递数据
            self.proView.proArr = NSMutableArray.init(array: proArray!)
            self.proView.cityArr = NSMutableArray.init(array: cityArray!)
            (self.proView.viewWithTag(1001) as! UITableView).reloadData()
            //self.proView.setNeedsLayout()
        }
    }
    
    
    // MARK: - 今天天气状况
    func makeTodayView(dic:[String:AnyObject]) -> Void {
        self.todayView.curTempL.text = dic["curTemp"] as? String
        self.todayView.typeL.text = (dic["type"] as? String)
        self.todayView.fengliL.text =  (dic["fengli"] as? String)
        self.todayView.fengxiangL.text = (dic["fengxiang"] as? String)
        if (dic["lowtemp"] as? String == nil) || ((dic["hightemp"] as? String) == nil) {
            
        } else {
            self.todayView.heightAndLowL.text = String.init(format: "%@%@%@", "    ",(dic["lowtemp"] as! String),(dic["hightemp"] as! String))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - 传递省的名字
extension ViewController:passProNameDelegate{
    func passProName(proName: String) {
        (self.leftView.viewWithTag(1002) as! UILabel).text = proName
    }
    func passCityNameFromProView(cityName: String) {
        (self.leftView.viewWithTag(1004) as! UILabel).text = cityName
        UIView.animateWithDuration(0.25) {
            //self.proView.removeFromSuperview()
            self.proView.hidden = true
        }
    }
    
    func passRequestData(retData: [String : AnyObject]) {
        self.makeTodayView((retData["today"] as! [String:AnyObject]))
        if (retData["history"] as? NSArray)?.count != 0{
            self.leftIndexView.dataArr = (retData["today"] as! [String:AnyObject])["index"] as! NSArray
            self.futureView.forecastArr = (retData["forecast"] as! NSArray)
            self.futureView.historyArr = (retData["history"] as! NSArray)
            self.futureView.todayDic = (retData["today"] as! NSDictionary)
            (self.futureView.viewWithTag(1012) as! UICollectionView).reloadData()
        }
    }
    
}

// MARK: - LifeIndexView 协议方法 (跳转到对应的指数界面)
extension ViewController:LifeIndexViewDelegate{
    func gotoIndexView(index: Int, dic: [String : AnyObject]) {
        let base = BaseIndexViewController()
        base.navigationItem.title = dic["name"] as? String
        base.dic = dic
        self.navigationController?.pushViewController(base, animated: true)
    }
}













