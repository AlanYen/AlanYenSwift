//
//  DateTimeViewController.swift
//  23-Change Date And Time
//
//  Created by AlanYen on 2016/5/16.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    
    deinit {
        print("DateTimeViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Set Date and Time"
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBarButtonItemClicked(sender: UIBarButtonItem) {
        
        let format = NSDateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        var dateTimeString = format.stringFromDate(datePicker.date)

        format.dateFormat = "hh:mm"
        dateTimeString = dateTimeString + "  " + format.stringFromDate(timePicker.date)
        
        NSNotificationCenter.defaultCenter().postNotificationName(
            "dateTimeChangedNotification",
            object: dateTimeString,
            userInfo: nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelBarButtonItemClicked(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setup() {
        
        datePicker.datePickerMode = .Date
        timePicker.datePickerMode = .Time
        
        // 10 year
        let timeInterval: NSTimeInterval = NSTimeInterval(60*60*24*365*10)
        let refDate = NSDate()
        print(refDate.description)
        
        let minDate = refDate.dateByAddingTimeInterval(-timeInterval)
        print(minDate.description)
        
        let maxDate = refDate.dateByAddingTimeInterval(timeInterval)
        print(maxDate.description)
        
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }
}