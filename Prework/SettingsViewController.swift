//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brandon Shamoo on 12/23/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipField1: UITextField!
    @IBOutlet weak var tipField2: UITextField!
    @IBOutlet weak var tipField3: UITextField!
    @IBOutlet weak var tipField4: UITextField!
    @IBOutlet weak var tipField5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets Nav title
        self.title = "Settings"
        
        tipField1.keyboardType = UIKeyboardType.numberPad
        tipField2.keyboardType = UIKeyboardType.numberPad
        tipField3.keyboardType = UIKeyboardType.numberPad
        tipField4.keyboardType = UIKeyboardType.numberPad
        tipField5.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    // Set tip input values in settings
    @IBAction func setTip1(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tipField1.text!) ?? 12, forKey: "myTip1")
        
        defaults.synchronize()
    }
    @IBAction func setTip2(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tipField2.text!) ?? 15, forKey: "myTip2")
        
        defaults.synchronize()
    }
    @IBAction func setTip3(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tipField3.text!) ?? 18, forKey: "myTip3")
        
        defaults.synchronize()
    }
    @IBAction func setTip4(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tipField4.text!) ?? 20, forKey: "myTip4")
        
        defaults.synchronize()
    }
    @IBAction func setTip5(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(tipField5.text!) ?? 25, forKey: "myTip5")
        
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipField1.becomeFirstResponder()
    }
    
    // Restore previous tip input values
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        
        tipField1.text! = String( defaults.integer(forKey: "myTip1"))
        tipField2.text! = String( defaults.integer(forKey: "myTip2"))
        tipField3.text! = String( defaults.integer(forKey: "myTip3"))
        tipField4.text! = String( defaults.integer(forKey: "myTip4"))
        tipField5.text! = String( defaults.integer(forKey: "myTip5"))
        
        defaults.synchronize()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
