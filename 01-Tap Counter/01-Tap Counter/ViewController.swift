//
//  ViewController.swift
//  01-Tap Counter
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapButton: UIButton?
    @IBOutlet weak var resetBarButtonItem: UIBarButtonItem?
    @IBOutlet weak var numberLabel: UILabel?
    var curNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        curNumber = 0;
        updateNumber()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButtonClicked(sender: UIButton) {
        
        curNumber += 1
        updateNumber()
    }
    
    @IBAction func resetBarButtonItemClicked(sender: UIBarButtonItem) {
        
        curNumber = 0
        updateNumber()
    }
    
    func updateNumber() {
        
        numberLabel?.text = String(curNumber)
    }
}