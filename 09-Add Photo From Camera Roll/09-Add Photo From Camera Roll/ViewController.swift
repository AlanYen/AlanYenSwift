//
//  ViewController.swift
//  09-Add Photo From Camera Roll
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,
                      UINavigationControllerDelegate,
                      UIImagePickerControllerDelegate {
    
    @IBOutlet weak var textView: UITextView?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var photoBarButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Photo From Camera Roll"

        textView?.layer.borderColor = UIColor.lightGrayColor().CGColor
        textView?.layer.borderWidth = (1.0 / UIScreen.mainScreen().scale)

        imageView?.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView?.layer.borderWidth = (1.0 / UIScreen.mainScreen().scale)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoBarButtonClicked(sender: UIBarButtonItem) {
        
        sender.enabled = false
        presentImagePickerController()
        sender.enabled = true
    }
    
    func presentImagePickerController() {
    
        // UIImagePickerController [PhotoLibrary]
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // kUTTypeImage
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if mediaType.isEqualToString(kUTTypeImage as String) {
            imageView?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        // Return key to dismiss keyboard
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}