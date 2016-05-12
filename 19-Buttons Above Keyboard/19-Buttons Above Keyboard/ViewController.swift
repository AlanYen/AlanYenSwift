//
//  ViewController.swift
//  19-Buttons Above Keyboard
//
//  Created by AlanYen on 2016/5/12.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var customInputAccessoryView: UIView!
    @IBOutlet var swiftButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Buttons Above Keyboard"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swiftButtonClicked(sender: UIButton) {
        
        let temp: String = textView.text + "\nThe Swift Programming Language\nhttps://swift.org/";
        textView.text = temp
    }
    
    @IBAction func doneButtonClicked(sender: UIButton) {
        
        textView.resignFirstResponder()
    }
    
    func setup() {
        
        // get the current date and time
        let currentDateTime = NSDate()
        
        // initialize the date formatter and set the style
        let formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        
        // get the date time String from the date object
        let t = formatter.stringFromDate(currentDateTime) // October 26, 2015 at 6:09:16 PM
        dateLabel.text = t
        
        textView.inputAccessoryView = customInputAccessoryView
        textView.layer.borderColor = UIColor.lightGrayColor().CGColor
        textView.layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
        textView.text = "Type some text here..."
    }
}