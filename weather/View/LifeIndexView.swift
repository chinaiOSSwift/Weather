//
//  LifeIndexView.swift
//  weather
//
//  Created by qianfeng on 16/10/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class LifeIndexView: UIView {
    var dataArr =  NSArray()
    let imageNames = ["healthIndex.png","sun.png","clothes.png","sport.png","car.png","dry.png"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSizeMake(self.mj_w / 4, self.mj_w / 4)
        print("高度 = \(self.mj_h)")
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 0, self.mj_w, self.mj_h), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.tag = 1011
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(UINib.init(nibName: "LiftIndexCell", bundle: nil), forCellWithReuseIdentifier: "LiftIndexCell")
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LifeIndexView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LiftIndexCell", forIndexPath: indexPath) as! LiftIndexCell
        print(imageNames[indexPath.row])
        cell.iconView.image = UIImage.init(named: imageNames[indexPath.row])
        cell.nameL.text = (dataArr[indexPath.row] as! [String:AnyObject])["name"] as? String
        return cell
    }
    
}