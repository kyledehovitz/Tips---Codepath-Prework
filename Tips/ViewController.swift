//
//  ViewController.swift
//  Tips
//
//  Created by Kyle DeHovitz on 4/30/15.
//  Copyright (c) 2015 Kyle DeHovitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var lineBreak: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // View loaded and you're doing your initial setup
        tipLabel.text = "+$0.00"
        totalLabel.text = "$0.00"
        self.totalLabel.alpha = 0
        self.lineBreak.alpha = 0
        self.tipTitle.alpha = 0
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        self.totalTitle.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // Optionally initialize the property to a desired starting value
//    self.totalLabel.alpha = 1
//    UIView.animateWithDuration(0.4, animations: {
//    // This causes first view to fade in and second view to fade out
//    self.totalLabel.alpha = 0
//    })
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveLinear, animations: {
                self.view.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height / 2) - 120)
                self.totalLabel.alpha = 1
                self.lineBreak.alpha = 1
                self.tipTitle.alpha = 1
                self.tipControl.alpha = 1
                self.tipLabel.alpha = 1
                self.totalTitle.alpha = 1
                self.view.backgroundColor = self.UIColorFromHex(0x2FA820, alpha: 1)
                self.totalLabel.textColor = self.UIColorFromHex(0xffffff, alpha: 1)
                self.billTitle.textColor = self.UIColorFromHex(0xffffff, alpha: 1)
                self.lineBreak.backgroundColor = self.UIColorFromHex(0xffffff, alpha: 1)
                self.tipTitle.textColor = self.UIColorFromHex(0xffffff, alpha: 1)
                self.tipLabel.textColor = self.UIColorFromHex(0xffffff, alpha: 1)
                self.totalTitle.textColor = self.UIColorFromHex(0xffffff, alpha: 1)

            }, completion: {
                (finished:Bool) in
        })
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveLinear, animations: {
            self.view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
            self.totalLabel.alpha = 0
            self.lineBreak.alpha = 0
            self.tipTitle.alpha = 0
            self.tipControl.alpha = 0
            self.tipLabel.alpha = 0
            self.totalTitle.alpha = 0
            self.billTitle.textColor = self.UIColorFromHex(0x000000, alpha: 1)
            self.view.backgroundColor = self.UIColorFromHex(0xffffff, alpha: 1)
            
            }, completion: {
                (finished:Bool) in
        })
    }
  

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "+$\(tip)"
        totalLabel.text = "$ \(total)"
        
        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

