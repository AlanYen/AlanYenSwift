//
//  ViewController.swift
//  03-Swift iAd
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    var bannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ADBannerView"
        
        // Reference :
        // https://www.hackingwithswift.com/read/18/2/iad-in-10-minutes
        setupBannerView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupBannerView() {
        
        // ADBannerView
        bannerView = ADBannerView(adType: .Banner)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.delegate = self
        bannerView.hidden = true
        view.addSubview(bannerView)
        
        // Autolayout
        let viewsDictionary = ["bannerView": bannerView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        
        // Success
        NSLog("Success!!")
        bannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        // Fail
        NSLog("Fail" + error.description)
        bannerView.hidden = true
    }
}