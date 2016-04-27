//
//  DetailViewController.swift
//  07-Passing Data to Another View
//
//  Created by AlanYen on 2016/4/27.
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