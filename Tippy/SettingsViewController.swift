//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Saneesh Chulliparambil on 12/25/19.
//  Copyright © 2019 slar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageController: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let savedIndex = defaults.integer(forKey: "selectedTipPercentage")
        tipPercentageController.selectedSegmentIndex = savedIndex
    }
    
    @IBAction func onTipPercentageChanged(_ sender: Any) {
        let  selIndex = tipPercentageController.selectedSegmentIndex
        print(selIndex)
        defaults.set(selIndex, forKey: "selectedTipPercentage")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
