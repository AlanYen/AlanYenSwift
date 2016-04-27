//
//  DetailViewController.swift
//  12-Add New Item
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

let kDefaultHintText: String = "type your text here ..."

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView?
    var doneBarButton: UIBarButtonItem?
    var dataSource: NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail"
        
        textView?.text = kDefaultHintText
        doneBarButton = UIBarButtonItem(title: "Done",
                                        style: .Done,
                                        target: self,
                                        action: #selector(DetailViewController.doneBarButtonClicked))
        self.navigationItem.rightBarButtonItem = doneBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doneBarButtonClicked(sender: UIBarButtonItem) {
    
        let text = textView?.text
        if text!.isEmpty || text == kDefaultHintText {
            self.showAlert("Text is empty!")
        }
        else {
            dataSource?.addObject(text!)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        textView.text = ""
        return true
    }
}