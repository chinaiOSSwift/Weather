//
//  MonthModelCell.swift
//  weather
//
//  Created by qianfeng on 16/10/9.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MonthModelCell: UICollectionViewCell {
    
    let scrollView = UIScrollView()
    var model:MonthModel?
    let namel = UILabel() // 名字
    let workConL = UILabel() // 工作
    let healthConL = UILabel() // 健康
    let loveConL = UILabel() // 爱情
    let moneyConL = UILabel() // 财运
    let allConL = UILabel() // 综合
    let dateConL = UILabel() // 日期
    
    //
    let workL = UILabel()
    let healthL = UILabel()
    let loveL = UILabel()
    let moneyL = UILabel()
    let allL = UILabel()
    let dateL = UILabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.userInteractionEnabled = true
        scrollView.frame = CGRectMake(0, 0, self.mj_w, self.mj_h)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.userInteractionEnabled = true
        scrollView.bounces = false
        scrollView.backgroundColor = contentColor
        // 姓名
        scrollView.addSubview(namel)
        // 工作
        scrollView.addSubview(workConL)
        // 健康
        scrollView.addSubview(healthConL)
        //爱情
        scrollView.addSubview(loveConL)
        // 财运
        scrollView.addSubview(moneyConL)
        // 综合
        scrollView.addSubview(allConL)
        //日期
        scrollView.addSubview(dateConL)
        
        //
        scrollView.addSubview(workL)
        scrollView.addSubview(healthL)
        scrollView.addSubview(loveL)
        scrollView.addSubview(moneyL)
        scrollView.addSubview(allL)
        scrollView.addSubview(dateL)
        
         self.contentView.addSubview(scrollView)
    }
    
    func customCellWithModel(model:MonthModel) -> Void{
        
        self.namel.frame = CGRectMake(50, 10, self.mj_w - 100, 23)
        namel.text = model.name
        namel.textAlignment = NSTextAlignment.Center
        namel.backgroundColor = UIColor.clearColor()
        namel.font = UIFont.systemFontOfSize(20)
        
        // 工作
        workL.frame = CGRectMake(10, namel.mj_y + namel.mj_h + 10, 60, 23)
        workL.textAlignment = NSTextAlignment.Center
        workL.text = "工作:"
        workL.font = UIFont.systemFontOfSize(20)
        
        
        let rect = (model.work as NSString).boundingRectWithSize(CGSizeMake(SCREEN_W - 20 - 60 - 6, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(20)], context: nil)
        
        workConL.frame = CGRectMake(workL.mj_x + workL.mj_w + 6, workL.mj_y,rect.width, rect.height)
        workConL.text = model.work
        workConL.numberOfLines = 0
        workConL.font = UIFont.systemFontOfSize(20)
        workConL.backgroundColor = UIColor.clearColor()
        
        
        // 健康
        
        let healthRect = (model.health as NSString).boundingRectWithSize(CGSizeMake(SCREEN_W - 20 - 60 - 6, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(20)], context: nil)
        
        healthConL.frame = CGRectMake(workConL.mj_x, workConL.mj_h + workConL.mj_y + 10,healthRect.width,healthRect.height)
        healthConL.text = model.health
        healthConL.numberOfLines = 0
        healthConL.font = UIFont.systemFontOfSize(20)
        healthConL.backgroundColor = UIColor.clearColor()
        
        
        healthL.frame = CGRectMake(workL.mj_x, healthConL.mj_y, 60, 23)
        healthL.textAlignment = NSTextAlignment.Center
        healthL.text = "健康:"
        healthL.font = UIFont.systemFontOfSize(20)
        
        
        // 爱情
        let loveRect = (model.love as NSString).boundingRectWithSize(CGSizeMake(SCREEN_W - 20 - 60 - 6, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(20)], context: nil)
        loveConL.frame = CGRectMake(workConL.mj_x, healthConL.mj_h + healthConL.mj_y + 10,loveRect.width,loveRect.height)
        loveConL.text = model.love
        loveConL.numberOfLines = 0
        loveConL.font = UIFont.systemFontOfSize(20)
        loveConL.backgroundColor = UIColor.clearColor()
        
        
        loveL.frame = CGRectMake(workL.mj_x, loveConL.mj_y, 60, 23)
        loveL.textAlignment = NSTextAlignment.Center
        loveL.text = "爱情:"
        loveL.font = UIFont.systemFontOfSize(20)
        
        
        
        // 财运
        let moneyRect = (model.money as NSString).boundingRectWithSize(CGSizeMake(SCREEN_W - 20 - 60 - 6, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(20)], context: nil)
        moneyConL.frame = CGRectMake(workConL.mj_x, loveConL.mj_h + loveConL.mj_y + 10,moneyRect.width,moneyRect.height)
        moneyConL.text = model.money
        moneyConL.numberOfLines = 0
        moneyConL.font = UIFont.systemFontOfSize(20)
        moneyConL.backgroundColor = UIColor.clearColor()
        
        
        moneyL.frame = CGRectMake(workL.mj_x, moneyConL.mj_y, 60, 23)
        moneyL.textAlignment = NSTextAlignment.Center
        moneyL.text = "财运:"
        moneyL.font = UIFont.systemFontOfSize(20)
        
        
        // all
        
        let allRect = (model.all as NSString).boundingRectWithSize(CGSizeMake(SCREEN_W - 20 - 60 - 6, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(20)], context: nil)
        
        allConL.frame = CGRectMake(workConL.mj_x, moneyConL.mj_h + moneyConL.mj_y + 10,allRect.width,allRect.height)
        allConL.text = model.all
        allConL.numberOfLines = 0
        allConL.font = UIFont.systemFontOfSize(20)
        allConL.backgroundColor = UIColor.clearColor()
        
        
        allL.frame = CGRectMake(workL.mj_x, allConL.mj_y, 60, 23)
        allL.textAlignment = NSTextAlignment.Center
        allL.text = "综合:"
        allL.font = UIFont.systemFontOfSize(20)
        
        
        dateConL.frame = CGRectMake(workConL.mj_x, allConL.mj_h + allConL.mj_y + 10,SCREEN_W - 20 - 60 - 6, 23)
        dateConL.text = model.date
        dateConL.font = UIFont.systemFontOfSize(20)
        dateConL.backgroundColor = UIColor.clearColor()
        
        
        dateL.frame = CGRectMake(workL.mj_x, dateConL.mj_y, 60, 23)
        dateL.textAlignment = NSTextAlignment.Center
        dateL.text = "日期:"
        dateL.font = UIFont.systemFontOfSize(20)
        scrollView.contentSize = CGSizeMake(self.mj_w, dateConL.mj_y + dateConL.mj_h + 10)
       
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}






















