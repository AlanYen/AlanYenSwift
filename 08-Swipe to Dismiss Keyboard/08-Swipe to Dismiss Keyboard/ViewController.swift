//
//  ViewController.swift
//  08-Swipe to Dismiss Keyboard
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
        
        self.title = "Swipe to Dismiss Keyboard"
        
        textView?.text = "type your text here ..."
        addSwipeGuesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBarButtonClicked(sender: UIBarButtonItem) {
        
        self.view.endEditing(true)
    }
    
    func addSwipeGuesture() {
        
        let swipeGuesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGuestureHandler))
        swipeGuesture.direction = UISwipeGestureRecognizerDirection.Down
        self.view .addGestureRecognizer(swipeGuesture)
    }
    
    func swipeGuestureHandler() {

        self.view.endEditing(true)
    }
}