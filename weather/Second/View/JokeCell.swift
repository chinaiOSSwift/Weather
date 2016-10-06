//
//  JokeCell.swift
//  weather
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class JokeCell: UITableViewCell {

    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var textL: UILabel!
    
    @IBOutlet weak var timeL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
