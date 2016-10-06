//
//  LifeIndexView.swift
//  weather
//
//  Created by qianfeng on 16/10/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol LifeIndexViewDelegate:NSObjectProtocol{
    func gotoIndexView(index:Int, dic:[String:AnyObject]) -> Void
}

class LifeIndexView: UIView {
    weak var delegate:LifeIndexViewDelegate?
    var dataArr =  NSArray()
    let imageNames = ["healthIndex.png","sun.png","clothes.png","sport.png","car.png","dry.png"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        let titleL = UILabel.init(frame: CGRectMake(0, 0, SCREEN_W, 20))
        titleL.text = "    生活指数"
        titleL.font = UIFont.systemFontOfSize(16)
        titleL.textAlignment = NSTextAlignment.Left
        titleL.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        self.addSubview(titleL)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSizeMake(self.mj_w / 4 - 2, self.mj_w / 4 - 2)
//        print("高度 = \(self.mj_h)")
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 30, self.mj_w, self.mj_h - 20), collectionViewLayout: layout)
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
// MARK: - UICollectionViewDelegate 协议方法
extension LifeIndexView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LiftIndexCell", forIndexPath: indexPath) as! LiftIndexCell
//        print(imageNames[indexPath.row])
        cell.iconView.image = UIImage.init(named: imageNames[indexPath.row])
        cell.nameL.text = (dataArr[indexPath.row] as! [String:AnyObject])["name"] as? String
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.gotoIndexView(indexPath.row,dic: (self.dataArr[indexPath.row] as! [String : AnyObject]))
    }
    
}