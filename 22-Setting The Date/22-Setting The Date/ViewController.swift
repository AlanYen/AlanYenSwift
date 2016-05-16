//
//  ViewController.swift
//  22-Setting The Date
//
//  Created by AlanYen on 2016/5/16.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setDateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Date"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDateButtonClicked(sender: UIButton) {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.title = strDate
    }
    
    func setup() {
        
        datePicker.datePickerMode = .Date
        
        // 1 year
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