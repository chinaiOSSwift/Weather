//
//  TodayView.swift
//  weather
//
//  Created by qianfeng on 16/10/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class TodayView: UIView {

    let curTempL = UILabel() // 气温标签
    let typeL = UILabel() // 天气类型
    let fengliL = UILabel() // 风力
    let fengxiangL = UILabel() // 风向
    let heightAndLowL = UILabel() // 最高气温 最低气温
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        curTempL.frame = CGRectMake(0, 0, 150, 100)
        curTempL.textAlignment = NSTextAlignment.Center
        curTempL.font = UIFont.systemFontOfSize(80)
//        curTempL.sizeToFit()
        curTempL.adjustsFontSizeToFitWidth = true
        curTempL.textColor = UIColor.whiteColor()
        curTempL.backgroundColor = UIColor.clearColor()
        curTempL.tag = 1006
        self.addSubview(curTempL)
        
        typeL.frame = CGRectMake(self.curTempL.mj_x + self.curTempL.mj_w, 0, 50, 50)
        typeL.textAlignment = NSTextAlignment.Center
        typeL.font = UIFont.systemFontOfSize(18)
        typeL.textColor = UIColor.whiteColor()
        typeL.backgroundColor = UIColor.clearColor()
        typeL.tag = 1007
        self.addSubview(typeL)
        
        fengliL.frame = CGRectMake(self.curTempL.mj_x, self.curTempL.mj_h + self.curTempL.mj_y, 100, 30)
        fengliL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        fengliL.textAlignment = NSTextAlignment.Center
        fengliL.font = UIFont.systemFontOfSize(18)
        fengliL.layer.masksToBounds = true
        fengliL.layer.cornerRadius = 10
        fengliL.textColor = UIColor.whiteColor()
        fengliL.tag = 1008
        self.addSubview(fengliL)
        
        fengxiangL.frame = CGRectMake(self.fengliL.mj_x + self.fengliL.mj_w, self.fengliL.mj_y, 100, 30)
        fengxiangL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        fengxiangL.textAlignment = NSTextAlignment.Center
        fengxiangL.font = UIFont.systemFontOfSize(18)
        fengxiangL.layer.masksToBounds = true
        fengxiangL.layer.cornerRadius = 10
        fengxiangL.adjustsFontSizeToFitWidth = true
        fengxiangL.textColor = UIColor.whiteColor()
        fengxiangL.tag = 1009
        self.addSubview(fengxiangL)
        
        
        heightAndLowL.frame = CGRectMake(self.fengliL.mj_x, self.fengliL.mj_y + self.fengliL.mj_h, self.mj_w, 30)
        heightAndLowL.backgroundColor = UIColor.clearColor()
        heightAndLowL.textAlignment = NSTextAlignment.Left
        heightAndLowL.font = UIFont.systemFontOfSize(18)
        heightAndLowL.textColor = UIColor.whiteColor()
        heightAndLowL.tag = 1010
        self.addSubview(heightAndLowL)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
