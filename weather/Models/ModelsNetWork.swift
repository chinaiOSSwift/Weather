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

// MARK: - 笑话的网络请求
extension JokeTextModel{
    class func requestJokeData(httpUrl: String, httpArg: String,callBack:(jokeData:[AnyObject]?, error:NSError?)->Void) -> Void {
        let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue(apikey, forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            if let d = data {
                //let content = NSString(data: d, encoding: NSUTF8StringEncoding)
                //print(content)
                let models = NSMutableArray()
                let dic = try! NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let array = (dic["showapi_res_body"] as! NSDictionary)["contentlist"] as! NSArray
                
                if array.count > 0 {
                    for dict in array{
                        models.addObject(JokeTextModel.createModel(dict as! [String: AnyObject]))
                    }
                }
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(jokeData: models as [AnyObject], error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(jokeData: nil, error: error)
                })
            }
        }
    }
    
}

// MARK: - 运势网络请求
extension LuckModel{
    class func requestData(httpUrl: String, httpArg: String,callBack:(model:LuckModel?, error:NSError?)->Void) -> Void {
        let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue(apikey, forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            if let d = data {
                //let content = NSString(data: d, encoding: NSUTF8StringEncoding)
                //print(content)
                let dic = try! NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let model = LuckModel.makeModel(dic)
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: model, error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: nil, error: error)
                })
            }
        }
    }
}
// 周模型
extension weekModel{
    class func requestData(httpUrl: String, httpArg: String,callBack:(model:weekModel?, error:NSError?)->Void) -> Void {
        let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue(apikey, forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            if let d = data {
                //let content = NSString(data: d, encoding: NSUTF8StringEncoding)
                //print(content)
                let dic = try! NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let model = weekModel.makeModel(dic)
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: model, error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: nil, error: error)
                })
            }
        }
    }
}

// 月模型
extension MonthModel{
    class func requestData(httpUrl: String, httpArg: String,callBack:(model:MonthModel?, error:NSError?)->Void) -> Void {
        let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue(apikey, forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            if let d = data {
                //let content = NSString(data: d, encoding: NSUTF8StringEncoding)
                //print(content)
                let dic = try! NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let model = MonthModel.makeModel(dic)
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: model, error: nil)
                })
                
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(model: nil, error: error)
                })
            }
        }
    }
}







