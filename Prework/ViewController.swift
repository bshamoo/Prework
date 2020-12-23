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
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.12, 0.15, 0.18, 0.2, 0.25]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

