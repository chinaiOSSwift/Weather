//
//  CityView.swift
//  weather
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol passCityNameDelegate:NSObjectProtocol {
    func passCityName(cityName:String) -> Void
    func passRetData(retData:[String:AnyObject]) ->Void
}


class CityView: UIView {
    // 代理指针
    weak var delegate:passCityNameDelegate?
    let tableView = UITableView()
    var cityArr = NSMutableArray()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.userInteractionEnabled = true
        self.tableView.frame = CGRectMake(0, 0, self.mj_w, self.mj_h)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.tag =  1000
        self.addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// MARK: - UITableView 的协议方法
extension CityView: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCellWithIdentifier("cityCell")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cityCell")
        }
        let model = self.cityArr[indexPath.row] as! CityModel
        cell?.textLabel?.text = model.name
//        cell?.detailTextLabel?.text = model.code
        return cell!
    }
    // 选中某一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = self.cityArr[indexPath.row] as! CityModel
        // 更改城市的名字
        self.delegate?.passCityName(model.name)
        
        /*
         var url = "http://apis.baidu.com/apistore/weatherservice/cityid"
         var httpArg = "cityid=101010100"
         request(url, httpArg: httpArg)
         func  request(httpUrl: String, httpArg: String) {
         */
        let url = "http://apis.baidu.com/apistore/weatherservice/recentweathers"
        // let urlCode = payStr.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        // 网址中有汉字或者特殊字符使用编码
//        let httpArg:String = ("cityname=\(model.name)&cityid=\(model.code)").stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let httpArg:String = ("cityname=\(model.name)&cityid=\(model.code)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        //
        BaseRequest.requestWeatherData(url, httpArg: httpArg) { (retData) in
            self.delegate?.passRetData(retData!)
        }
        
    }
    
}
























