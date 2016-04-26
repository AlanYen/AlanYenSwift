//
//  DetailViewController.swift
//  05-Basic Table View
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel?
    var detail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail"
        
        label?.text = detail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}