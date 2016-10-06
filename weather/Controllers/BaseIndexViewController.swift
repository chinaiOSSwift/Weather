//
//  BaseIndexViewController.swift
//  weather
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class BaseIndexViewController: UIViewController {

    
    
    @IBOutlet weak var indexL: UILabel!
    
    @IBOutlet weak var detailL: UILabel!
    var dic: NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "indexBG.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        if let d = dic{
            indexL.text = d["index"] as? String
            detailL.text = d["details"] as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
