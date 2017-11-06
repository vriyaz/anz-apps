//
//  MasterViewController.swift
//  az-words
//
//  Created by Vali, Riyaz on 10/24/17.
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
                
        if let identifier = segue.identifier {
            destinationViewController.navigationItem.title = identifier
        }
    }
}
