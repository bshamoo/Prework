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
    }
    
    @IBAction func onTap(_ sender: Any) {
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Init defaults to store local data
        let defaults = UserDefaults.standard
        
        // Get initial bill amount and calculate tips
        defaults.set(Double(billAmountTextField.text!) ?? 0, forKey: "myBill")
        let bill = defaults.double(forKey: "myBill")
        
        let tipPercentages = [0.12, 0.15, 0.18, 0.2, 0.25]
        
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
        print("view will appear")
        // Init defaults to set local data
        let defaults = UserDefaults.standard
        
        if(defaults.double(forKey: "myBill") != 0) {
            billAmountTextField.text = String(format: "%.2f", defaults.double(forKey: "myBill"))
        }
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myTipIndex")
        tipPercentageLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTip"))
        totalLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTotal"))
        
        defaults.synchronize()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

