//
//  TodayOrTomorrowCellCollectionViewCell.swift
//  weather
//
//  Created by qianfeng on 16/10/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class TodayOrTomorrowCellCollectionViewCell: UICollectionViewCell {
    
    var todayModel:LuckModel?
    
    
    @IBOutlet weak var nameL: UILabel!
    
    @IBOutlet weak var QFL: UILabel!
    
    @IBOutlet weak var workL: UILabel!
    
    @IBOutlet weak var allL: UILabel!
    
    
    @IBOutlet weak var loveL: UILabel!
    
    @IBOutlet weak var colorL: UILabel!
    
    @IBOutlet weak var moneyL: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    
    @IBOutlet weak var healthL: UILabel!
    
    
    @IBOutlet weak var numberL: UILabel!
    
    
    @IBOutlet weak var summaryL: UILabel!
    
    func customWithModel(model:LuckModel?) -> Void{
        nameL.text = model?.name
        QFL.text = model?.QFriend
        workL.text = model?.work
        allL.text = model?.all
        loveL.text = model?.love
        colorL.text = model?.color
        moneyL.text = model?.money
        dateL.text = model?.datetime
        healthL.text = model?.health
        if model != nil{
            numberL.text = String((model!.number).integerValue)
        }
        summaryL.text = model?.summary
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
