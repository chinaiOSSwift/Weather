//
//  FutureView.swift
//  weather
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class FutureView: UIView {
    
    var historyArr: NSArray = NSArray()
    var forecastArr:NSArray = NSArray()
    var todayDic:NSDictionary = NSDictionary()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let titleL = UILabel.init(frame: CGRectMake(0, 0, SCREEN_W, 20))
        titleL.text = "    未来天气"
        titleL.font = UIFont.systemFontOfSize(16)
        titleL.textAlignment = NSTextAlignment.Left
        titleL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        self.addSubview(titleL)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .Horizontal
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 20, self.mj_w, self.mj_h - 20), collectionViewLayout: layout)
        collectionView.registerNib(UINib.init(nibName: "FutureCell", bundle: nil), forCellWithReuseIdentifier: "FutureCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
        collectionView.tag = 1012
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.contentOffset = CGPointMake(SCREEN_W, 0)
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 协议方法
extension FutureView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (historyArr.count + forecastArr.count + 1)
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FutureCell", forIndexPath: indexPath) as! FutureCell
        if indexPath.row <= 6{
            cell.customCellWith((self.historyArr[indexPath.row] as! [String : AnyObject]))
        }else if indexPath.row == 7{
            
            cell.customCellWith(todayDic as! [String : AnyObject])
        }else{
            
            cell.customCellWith((self.forecastArr[indexPath.row - 8] as! [String : AnyObject]))
        }
        if indexPath.row == 8{
            cell.weakL.text = "明天"
        }
        if indexPath.row == 6{
            cell.weakL.text = "昨天"
        }
        if indexPath.row == 7{
            cell.weakL.text = "今天"
        }
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(SCREEN_W / 6, 150)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}












