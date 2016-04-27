//
//  ViewController.swift
//  06-Getting Current Date and Time
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var refreshButton: UIButton?
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshButtonClicked(sender: UIButton) {
        
        stopTimer()
        updateTimeLabel()
        startTimer()
    }
    
    func stopTimer() {
        
        if timer != nil {
            timer?.invalidate()
        }
        timer = nil
    }
    
    func startTimer() {

        stopTimer()
        if timer == nil {
            timer =
                NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                       target: self,
                                                       selector: #selector(ViewController.updateTimeLabel),
                                                       userInfo: nil,
                                                       repeats: true)
        }
    }
    
    func updateTimeLabel() {
        
        // Reference:
        // http://www.helloswift.com.cn/swiftbase/2015/0328/3532.html
        let now = NSDate()
        let formatter = NSDateFormatter()
        
        // Case-1
        //formatter.dateFormat = "MM-dd,yyyy HH:mm:ss"
        //let nowString: String = dateFormatter.stringFromDate(now)
        
        // Case-2 [3:11 AM on July 17, 2015]
        formatter.dateFormat = "HH:mm:ss a 'on' MMMM dd, yyyy"
        //formatter.AMSymbol = "AM" <== 修改 AM 的顯示
        //formatter.PMSymbol = "PM" <== 修改 PM 的顯示
        let nowString: String = formatter.stringFromDate(now)
        
        timeLabel?.text = nowString
    }
}