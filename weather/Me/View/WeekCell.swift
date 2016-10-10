//
//  WeekCell.swift
//  weather
//
//  Created by qianfeng on 16/10/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class WeekCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var healthL: UILabel!
    @IBOutlet weak var jobL: UILabel!
    
    @IBOutlet weak var loveL: UILabel!
    
    
    @IBOutlet weak var moneyL: UILabel!
    
    
    @IBOutlet weak var workL: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    
    
    func customWithModel(model:weekModel?) -> Void{
        nameL.text = model?.name
        healthL.text = model?.health
        jobL.text = model?.job
        loveL.text = model?.love
        moneyL.text = model?.money
        workL.text = model?.work
        dateL.text = model?.date
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
