//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brandon Shamoo on 12/23/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets Nav title
        self.title = "Settings"
        
        //let pickerData = ["$USD", "€EUR", "¥JPY", "£GBP", "$CAD"]
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
}
