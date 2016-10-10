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

// MARK: - 笑话模型
class JokeTextModel: NSObject {
    var ct:String!
    var text:String!
    var title:String!
    // 通过一个字典构建一个对象
    class func createModel(dic:[String:AnyObject]) -> JokeTextModel{
        let joke = JokeTextModel()
        joke.ct = dic["ct"] as! String
        joke.text = dic["text"] as! String
        joke.title = dic["title"] as! String
        return joke
    }
}

// MARK: - 今日或明日运势模型

class LuckModel: NSObject {
    var name:String! // 星座名称
    var datetime:String! // 日期
    var QFriend:String! // 速配星座
    var all:String! // 综合指数
    var color:String! // 幸运色
    var health:String! // 健康指数
    var love:String! // 爱情指数
    var money:String! // 财运指数
    var number:NSNumber! // 幸运数字
    var work:String! // 工作指数
    var summary:String! // 总结
    
    class func makeModel(dic:NSDictionary) -> LuckModel{
        let model = LuckModel()
        model.name = dic["name"] as? String
        model.datetime = dic["datetime"] as? String
        model.QFriend = dic["QFriend"] as? String
        model.all = dic["all"] as? String
        model.color = dic["color"] as? String
        model.health = dic["health"] as? String
        model.love = dic["love"] as? String
        model.money = dic["money"] as? String
        model.number = dic["number"] as? NSNumber
        model.work = dic["work"] as? String
        model.summary = dic["summary"] as? String
        return model
    }
}
/*
 {
	"date":20151214, /*日期数值*/
	"name":"双子座", /*星座名称*/
	"QFriend":"摩羯座", /*速配星座*/
	"all":"40%", /*综合指数*/
	"color":"黄色", /*幸运色*/
	"datetime":"2015年12月14日", /*日期*/
	"health":"55%", /*健康指数*/
	"love":"40%", /*爱情指数*/
	"money":"40%", /*财运指数*/
	"number":4, /*幸运数字*/
	"summary":"依旧是家庭和工作蜡烛二头烧的你，体力真的不堪负荷，超级无敌爆累，已经濒临零界点，一触即发，要好好耐住性子沟通，变得好困难，最后还是吵架了，但也许吵架了吵出彼此的苦，才会换来体谅吧，最终还是家人啊！", /*总结*/
	"work":"40%", /*工作指数*/
	"resultcode":"200", /*返回状态码 200为成功*/
	"error_code":0 /*返回错误码 0为没有错误*/
 }
 */


/*
 "date":"2015年12月13日-2015年12月19日", /*日期*/
	"health":"健康：触发的疾病多和以往享受过度有关。伴侣健康需关注。",
	"job":"求职：运气不错，有望争取到喜欢的职位。 ",
	"love":"恋情：情感中会主动付出，但也在意对方的回应，挑剔、计较多，引发对方反弹。单身的，偏自恋。 ",
	"money":"财运：有合作生财机会，但存在较多变数。正财运旺，多劳多得法则灵验。 ",
	"name":"双子座",
	"weekth":51, /*一年中的第几周*/
	"work":"工作：猜忌、不信任的心态下，展开合作。所幸，当下的工作内容是你喜欢的。 ",
	"resultcode":"200",
	"error_code":0
 */

class weekModel:NSObject{
    var date:String! // 日期
    var health:String! // 健康
    var job:String! //
    var love:String!
    var money:String!
    var name:String!
    var work:String!
    
    class func makeModel(dic:NSDictionary) -> weekModel{
        let model = weekModel()
        model.date = dic["date"] as? String
        model.health = dic["health"] as? String
        model.job = dic["job"] as? String
        model.love = dic["love"] as? String
        model.money = dic["money"] as? String
        model.name = dic["name"] as? String
        model.work = dic["work"] as? String
        return model
    }
    
}

//MARK: - 月模型
class MonthModel:NSObject {
    var all:String!
    var date:String!
    var happyMagic:String!
    var health:String!
    var love:String!
    var money:String!
    var work:String!
    var name:String!

    class func makeModel(dic:NSDictionary) -> MonthModel{
        let model = MonthModel()
        model.all = dic["all"] as? String
        model.date = dic["date"] as? String
        model.happyMagic = dic["happyMagic"] as? String
        model.health = dic["health"] as? String
        model.love = dic["love"] as? String
        model.money = dic["money"] as? String
        model.work = dic["work"] as? String
        model.name = dic["name"] as? String
        return model
    }
    
}












