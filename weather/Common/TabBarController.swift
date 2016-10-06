//
//  TabBarController.swift
//  weather
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    func makeUI() -> Void {
        let proName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // plist
        let path = NSBundle.mainBundle().pathForResource("TabBarList.plist", ofType: nil)
        
        let plistArr = NSArray.init(contentsOfFile: path!) as! [[String:AnyObject]]
        
        for dic in plistArr{
            let name = proName + "." + (dic["viewClass"] as! String)
            let cls = NSClassFromString(name) as! UIViewController.Type
            let vc = cls.init()
            
            let nav = UINavigationController.init(rootViewController: vc)
            vc.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
            
            let image = UIImage.init(named: dic["image"] as! String)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let selectedImage = UIImage.init(named: dic["selectedImage"] as! String)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            nav.tabBarItem = UITabBarItem.init(title: (dic["title"] as! String), image: image!, selectedImage: selectedImage!)
            self.tabBar.backgroundImage = UIImage.init(named: "tab_bg.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            self.addChildViewController(nav)
            
        }
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

















