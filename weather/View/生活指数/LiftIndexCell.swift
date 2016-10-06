//
//  LiftIndexCell.swift
//  weather
//
//  Created by qianfeng on 16/10/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class LiftIndexCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
   
    @IBOutlet weak var nameL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameL.backgroundColor =  UIColor.init(white: 0.5, alpha: 0.5)
        self.nameL.layer.masksToBounds = true
        self.nameL.layer.cornerRadius = 10
    }
    
}
