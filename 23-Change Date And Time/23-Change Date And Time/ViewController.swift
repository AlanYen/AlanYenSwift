//
//  ViewController.swift
//  23-Change Date And Time
//
//  Created by AlanYen on 2016/5/16.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var changeDateButton: UIButton!
    
    deinit {
        print("ViewController deinit")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Date and Time"
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        let format = NSDateFormatter()
        format.dateFormat = "yyyy/MM/dd  hh:mm"
        dateTimeLabel.text = format.stringFromDate(NSDate())
        
        addNotificationobserver()
    }
    
    func addNotificationobserver() {

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(dateTimeChangedNotificationHandler),
            name: "dateTimeChangedNotification",
            object: nil)
    }
    
    func dateTimeChangedNotificationHandler(notification: NSNotification) {
        
        dateTimeLabel.text = notification.object as? String
    }
}