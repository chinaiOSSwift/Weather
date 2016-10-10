//
//  FutureCell.swift
//  weather
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class FutureCell: UICollectionViewCell {

    
    @IBOutlet weak var weakL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var typeL: UILabel!
    @IBOutlet weak var fengxiangL: UILabel!
    @IBOutlet weak var fengliL: UILabel!
    @IBOutlet weak var heightL: UILabel!
    @IBOutlet weak var lowL: UILabel!
    
    
    func customCellWith(dic:[String:AnyObject]) -> Void{
        weakL.text = dic["week"] as? String
        let dateArr = (dic["date"] as? String)?.componentsSeparatedByString("-")
        
        if dateArr!.count >= 3{
            dateL.text = String.init(format: "%@-%@", (dateArr![1]),(dateArr![2]))
        }else{
            dateL.text = dic["date"] as? String
        }
        
        typeL.text = dic["type"] as? String
        fengxiangL.text = dic["fengxiang"] as? String
        fengliL.text = dic["fengli"] as? String
        heightL.text = dic["hightemp"] as? String
        lowL.text = dic["lowtemp"] as? String
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
