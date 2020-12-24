//
//  ViewController.swift
//  Prework
//
//  Created by Brandon Shamoo on 12/22/20.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Sets Nav title
        self.title = "Tip Calculator"
        // Set keyboard to always be visible and to a decimal pad
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
    }
    
    @IBAction func onTap(_ sender: Any) {
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Init defaults to store local data
        let defaults = UserDefaults.standard
        
        // Get initial bill amount and calculate tips
        defaults.set(Double(billAmountTextField.text!) ?? 0, forKey: "myBill")
        let bill = defaults.double(forKey: "myBill")
        
        // Set inputted tip percentages
        var tipPercentages = [0.12, 0.15, 0.18, 0.2, 0.25]
        for i in 0...4 {
            tipPercentages[i] = (Double(defaults.integer(forKey: "myTip" + String(i  + 1))) / 100)
        }
        
        // Calculate tip and total
        defaults.set(tipControl.selectedSegmentIndex, forKey: "myTipIndex")
        defaults.set(bill * tipPercentages[tipControl.selectedSegmentIndex], forKey: "myTip")
        let tip = defaults.double(forKey: "myTip")
        
        defaults.set(bill + tip, forKey: "myTotal")
        let total = defaults.double(forKey: "myTotal")
        
        // Update tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billAmountTextField.becomeFirstResponder()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Init defaults to set local data
        let defaults = UserDefaults.standard
        
        // Restore previous inputted values
        if(defaults.double(forKey: "myBill") != 0) {
            billAmountTextField.text! = String(format: "%.2f", defaults.double(forKey: "myBill"))
        }
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myTipIndex")
        tipPercentageLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTip"))
        totalLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTotal"))
        
        // Set title percentages for tip segmented control
        tipControl.setTitle(String( defaults.integer(forKey: "myTip1")) + "%", forSegmentAt: 0 )
        tipControl.setTitle(String( defaults.integer(forKey: "myTip2")) + "%", forSegmentAt: 1 )
        tipControl.setTitle(String( defaults.integer(forKey: "myTip3")) + "%", forSegmentAt: 2 )
        tipControl.setTitle(String( defaults.integer(forKey: "myTip4")) + "%", forSegmentAt: 3 )
        tipControl.setTitle(String( defaults.integer(forKey: "myTip5")) + "%", forSegmentAt: 4 )
        
        defaults.synchronize()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

