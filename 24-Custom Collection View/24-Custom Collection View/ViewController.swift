//
//  ViewController.swift
//  24-Custom Collection View
//
//  Created by AlanYen on 2016/5/13.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Custom Collection View"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareDataSource() {

        for _ in 0...36 {
            dataSource.append("https://pmcdeadline2.files.wordpress.com/2014/06/apple-logo.jpg")
        }
    }
    
    func setup() {
        
        prepareDataSource()
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        collectionView.backgroundColor = UIColor.orangeColor()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.itemSize = CGSize(width: screenWidth / 3.0, height: screenWidth / 3.0)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        collectionView.collectionViewLayout = layout
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCellWithReuseIdentifier("CustomCollectionViewCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        let urlString = dataSource[indexPath.row]
        
        cell.imageView.kf_setImageWithURL(NSURL(string: urlString)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.CacheMemoryOnly],
                                          progressBlock: { (receivedSize, totalSize) in
                                            print("Download Progress: \(receivedSize)/\(totalSize)")
            },
                                          completionHandler: { (image, error, cacheType, imageURL) in
                                            print("Downloaded and set! (\(indexPath.item))")
            })
        
        return cell;
    }
}