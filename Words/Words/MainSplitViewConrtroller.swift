//
//  MainSplitViewConrtroller.swift
//  az-words
//
//  Created by Vali, Riyaz on 10/25/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class MainSplitViewConrtroller: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
