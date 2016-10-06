//
//  ModelsNetWork.swift
//  weather
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import Foundation

extension ProvinceModel {
    
    class func requestDataArrays(path:String,callBack:(proArray:[AnyObject]?, cityArray:[AnyObject]?) -> Void) -> Void {
        let proArr = NSMutableArray()
        let cityArr = NSMutableArray()
        let data = NSData.init(contentsOfFile: path)
        if data != nil{
            let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            let array = obj["城市代码"] as! NSArray
            
            for dict in array{
                //在这里创建省
                proArr.addObject(ProvinceModel.makeModel(dict as! [String:AnyObject]))
                let tempCityArr = NSMutableArray()
                for dic in dict["市"] as! NSArray{
                    tempCityArr.addObject(CityModel.createModel(dic as! [String:AnyObject]))
                }
                cityArr.addObject(tempCityArr)
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                callBack(proArray: proArr as [AnyObject], cityArray: cityArr as [AnyObject])
            })
            
        }else{// 返回主线程
            dispatch_async(dispatch_get_main_queue(), {
                callBack(proArray: nil, cityArray: nil)
            })
        }
    }
}



    















