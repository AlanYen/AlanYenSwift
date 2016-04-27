//
//  UIViewController+Alert.swift
//  12-Add New Item
//
//  Created by AlanYen on 2016/4/20.
//  Copyright © 2016年 Alan.Yen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(message: String, title: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default, handler: nil)
        alertController.addAction(confirmAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}