//
//  DetailViewController.swift
//  16-Building The User Interface
//
//  Created by AlanYen on 2016/4/28.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var infoData: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Building The User Interface"
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        if infoData != nil {
            nameLabel.text = infoData!["name"] as? String
            mobileLabel.text = infoData!["mobile"] as? String
            emailLabel.text = infoData!["email"] as? String
            notesLabel.text = infoData!["notes"] as? String
            
            var url: NSURL? = nil
            if infoData!["avatar"] != nil {
                url = NSURL(string: infoData!["avatar"]! as! String)
            }
            profileImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "profile"))
            profileImageView.layer.cornerRadius = CGRectGetWidth(profileImageView.frame) / 2.0
        }
    }
}