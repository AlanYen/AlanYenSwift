//
//  MoneyNumberTextFiled.swift
//  04-Tip Calculator
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class MoneyNumberTextFiled: UITextField, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        
        addToolBar()
    }
    
    func addToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        let spaceButton =
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneButton =
            UIBarButtonItem(title: "Done",
                            style: UIBarButtonItemStyle.Done,
                            target: self,
                            action: #selector(MoneyNumberTextFiled.doneButtonClicked))
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        self.inputAccessoryView = toolBar
    }
    
    func doneButtonClicked() {

        self.resignFirstResponder()
    }
}