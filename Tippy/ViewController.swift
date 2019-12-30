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
        let savedBillAmount = defaults.integer(forKey: "bill_amount")
        let savedTime = defaults.integer(forKey: "savedTime")
        
        if(currentTimeInMilliSeconds() - savedTime > 60*1000){
            saveBillInfo(amount: 0)
        }  else {
            billAmountTextField.text = String(savedBillAmount)
        }
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
        
        saveBillInfo(amount: billAmount)
    }
    
    func saveBillInfo(amount: Double){
        defaults.set(amount, forKey: "bill_amount")
        defaults.set(currentTimeInMilliSeconds(), forKey: "savedTime")
        defaults.synchronize()
    }
    
    func currentTimeInMilliSeconds()-> Int
    {
        let currentDate = Date()
        let since1970 = currentDate.timeIntervalSince1970
        return Int(since1970 * 1000)
    }
}

