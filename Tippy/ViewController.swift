//
//  ViewController.swift
//  Tippy
//
//  Created by Saneesh Chulliparambil on 12/23/19.
//  Copyright © 2019 slar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    let tipPercentages  = [0.15, 0.18, 0.2]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let savedIndex = defaults.integer(forKey: "selectedTipPercentage")
        tipSegment.selectedSegmentIndex = savedIndex
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let billAmount = Double(billAmountTextField.text!) ?? 0
        let tipAmount = billAmount * tipPercentages[tipSegment.selectedSegmentIndex]
        let totalAmount =  billAmount + tipAmount
    
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
}

