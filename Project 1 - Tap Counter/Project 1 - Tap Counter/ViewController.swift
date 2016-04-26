//
//  ViewController.swift
//  Project 1 - Tap Counter
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
        numberLabel?.text = String(curNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButtonClicked(sender: UIButton) {
        
        curNumber += 1
        numberLabel?.text = String(curNumber)
    }
    
    @IBAction func resetBarButtonItemClicked(sender: UIBarButtonItem) {
        
        curNumber = 0
        numberLabel?.text = String(curNumber)
    }
}