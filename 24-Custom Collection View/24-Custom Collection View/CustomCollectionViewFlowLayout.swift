//
//  CustomCollectionViewFlowLayout.swift
//  24-Custom Collection View
//
//  Created by AlanYen on 2016/5/13.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        itemSize = CGSize(width: screenWidth / 3.0, height: screenWidth / 3.0)
        minimumInteritemSpacing = 0.0
        minimumLineSpacing = 0.0
    }
    
    override func prepareLayout() {
        super.prepareLayout()

        if (attributesArray.count > 0) {
            attributesArray.removeAll()
        }
        
        if let itemCount = collectionView?.numberOfItemsInSection(0) {
            for i in 0 ..< itemCount {
                let indexPath = NSIndexPath(forItem: i, inSection: 0)
                let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)

                // 中心點依序旋轉排列
                if let center = collectionView?.center {
                    attribute.center = center
                }
                attribute.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) / CGFloat(i + 1) * CGFloat(i))
                
                // 橫向依序排列
                //let screenHeight = UIScreen.mainScreen().bounds.size.height
                //attribute.center = CGPointMake(itemSize.width / 2.0 * CGFloat(i + 1), (screenHeight / 2.0))
                
                attribute.size = itemSize
                attributesArray.append(attribute)
            }
        }
    }
    
    override func collectionViewContentSize() -> CGSize {

        if let bounds = collectionView?.bounds {
            return bounds.size
        }
        return CGSizeZero
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func invalidateLayout() {
        super.invalidateLayout()
        
        attributesArray.removeAll()
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        print("layoutAttributesForItemAtIndexPath")
        return attributesArray[indexPath.item]
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArray
    }
}