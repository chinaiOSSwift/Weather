//
//  ProvinceView.swift
//  weather
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol passProNameDelegate:NSObjectProtocol {
    func passProName(proName:String) -> Void
    func passCityNameFromProView(cityName:String) -> Void
    func passRequestData(retData:[String:AnyObject]) -> Void
}


class ProvinceView: UIView {
    // 代理指针
    weak var delegate:passProNameDelegate?
    let tableView = UITableView()
    var proArr = NSMutableArray()
    var cityArr = NSMutableArray()
    var selectedCell:NSIndexPath = NSIndexPath.init(forRow: 0, inSection: 0)
    
    // MARK: - 用来展示对应的城市列表
    lazy var cityView:CityView = {
        let frame = CGRectMake(self.tableView.mj_x + self.tableView.mj_w, 0, self.tableView.mj_w, self.tableView.mj_h)
        let cityView:CityView = CityView.init(frame: frame)
        cityView.tag = 1003
        cityView.userInteractionEnabled = true
        cityView.delegate = self
        self.addSubview(cityView)
        return cityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.userInteractionEnabled = true
        self.tableView.frame = CGRectMake(0, 0, self.mj_w / 2, self.mj_h)
        self.tableView.backgroundColor = UIColor.grayColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.tag =  1001
        self.addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - UITableView 的协议方法
extension ProvinceView: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.proArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cellID")
            cell?.textLabel?.textAlignment = NSTextAlignment.Center
        }
        cell?.textLabel?.text = (self.proArr[indexPath.row] as! ProvinceModel).name
//        cell?.detailTextLabel?.text =  "第\(indexPath.row) 个"
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if self.selectedCell != indexPath{
            let cell = tableView.cellForRowAtIndexPath(self.selectedCell)
            cell?.accessoryType = .None
            self.selectedCell = indexPath
        }
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .DisclosureIndicator

        
        // 传值
        self.delegate?.passProName((self.proArr[indexPath.row] as! ProvinceModel).name)
        
        UIView.animateWithDuration(0.25) {
            self.cityView.cityArr = self.cityArr[indexPath.row] as! NSMutableArray
            (self.cityView.viewWithTag(1000) as! UITableView).reloadData()
        }
        
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath != self.selectedCell{
            cell.accessoryType = .None
        }else{
            
            cell.accessoryType = .DisclosureIndicator
        }
    }
}


// MARK: - 传递城市的名字
extension ProvinceView:passCityNameDelegate{
    func passCityName(cityName: String) {
        self.delegate?.passCityNameFromProView(cityName)
    }
    func passRetData(retData: [String : AnyObject]) {
        self.delegate?.passRequestData(retData)
    }
}



