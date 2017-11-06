//
//  SettingsViewController.swift
//  az-math
//
//  Created by Vali, Riyaz on 10/25/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var level: UISegmentedControl!
    
    let userDefaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        level.selectedSegmentIndex = userDefaults.integer(forKey: "level")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func levelChanged(_ sender: UISegmentedControl) {
        print ("\(sender.selectedSegmentIndex)")
        userDefaults.set(sender.selectedSegmentIndex, forKey: "level")
    }
    
}
