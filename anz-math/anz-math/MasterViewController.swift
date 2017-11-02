//
//  MasterViewController.swift
//  az-math
//
//  Created by Vali, Riyaz on 10/23/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        
        if let mathViewController = destinationViewController as? MathViewController,
            let identifier = segue.identifier,
            let senderTitle = (sender as? UIButton)?.currentTitle {
            print ("MasterViewController.prepare: \(identifier) \(senderTitle)")
            mathViewController.navigationItem.title = identifier
            mathViewController.mathOperation = senderTitle
        }
        
        if let settingsViewController = destinationViewController as? SettingsViewController,
            let identifier = segue.identifier {
            settingsViewController.navigationItem.title = identifier
        }
    }
}
