//
//  ViewController.swift
//  07-Passing Data to Another View
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView?
    @IBOutlet weak var doneBarButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Passing Data to Another View"
        
        textView?.text = "type your text here .."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc: DetailViewController = segue.destinationViewController as! DetailViewController
        vc.detail = textView?.text
    }
    
    @IBAction func doneBarButtonClicked(sender: UIBarButtonItem) {
    
        self.performSegueWithIdentifier("ToDetailViewController", sender: self)
    }
}