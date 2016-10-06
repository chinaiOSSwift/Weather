//
//  MakeModels.swift
//  weather
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import Foundation


// MARK: - 省的模型
class ProvinceModel: NSObject {
    var name:String!
    class func makeModel(dict:[String:AnyObject]) -> ProvinceModel{
        let province = ProvinceModel()
        province.name = dict["省"] as! String
        return province
    }
}

//MARK: - 城市的模型
class CityModel: NSObject {
    var name:String!
    var code:String!
    
    // 通过一个字典构建一个对象
    class func createModel(dict:[String:AnyObject]) -> CityModel{
        let city = CityModel()
        city.name = dict["市名"] as! String
        city.code = dict["编码"] as! String
        return city
    }
    
    
}


