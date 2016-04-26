//
//  ViewController.swift
//  04-Tip Calculator
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputTextField: MoneyNumberTextFiled?
    @IBOutlet weak var addTitleLabel: UILabel?
    @IBOutlet weak var addDetailLabel: UILabel?
    @IBOutlet weak var sumTitleLabel: UILabel?
    @IBOutlet weak var sumDetailLabel: UILabel?
    @IBOutlet weak var slider: UISlider?
    var inputValue: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        let value: Float = roundf(slider!.value)
        slider?.value = value
        updateUI(value)
    }
    
    func setup()  {
        
        inputTextField?.placeholder = "$0.00"
        inputTextField?.text = ""
        inputTextField?.borderStyle = .None
        
        addTitleLabel?.text = "Tip (0%)"
        addDetailLabel?.text = "$0"
        sumTitleLabel?.text = "Total:"
        sumDetailLabel?.text = "$0"
        
        slider?.value = 0.0
        slider?.minimumValue = 0.0
        slider?.maximumValue = 100.0
        slider?.continuous = true
        slider?.enabled = false
    }
    
    func updateUI(sliderValue: Float) {
        
        addTitleLabel?.text = String(format: "Tip (%.0f%%)", sliderValue)
        
        let tmp: Float = (inputValue * (sliderValue / 100.0))
        addDetailLabel?.text = String(format: "$%.2f", tmp)

        let sum: Float = (inputValue + tmp)
        sumDetailLabel?.text = String(format: "$%.2f", sum)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if (inputTextField?.text != nil &&
            inputTextField?.text!.characters.count > 0) {
            inputValue = Float((inputTextField?.text)!)!
            inputTextField?.text = String(format: "$%.2f", inputValue)
            slider?.enabled = true
        }
        else {
            inputValue = 0.0
            slider?.enabled = false
        }
        updateUI(0.0)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if (inputTextField?.text != "") {
            inputTextField?.text = String(Int(inputValue));
        }
        return true
    }
}