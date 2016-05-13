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

        for i in 0..<8 {
            switch i%3 {
                case 0:
                    dataSource.append("https://pmcdeadline2.files.wordpress.com/2014/06/apple-logo.jpg")
                case 1:
                    dataSource.append("http://www.iconsdb.com/icons/preview/red/apple-xxl.png")
                case 2:
                    dataSource.append("https://cdn3.iconfinder.com/data/icons/yummicon-pro/100/002_Apple-512.png")
                default:
                    dataSource.append("https://pmcdeadline2.files.wordpress.com/2014/06/apple-logo.jpg")
            }
        }
    }
    
    func setup() {
        
        prepareDataSource()
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        let layout = CustomCollectionViewFlowLayout()
        collectionView?.collectionViewLayout = layout
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