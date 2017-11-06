//
//  PopUpViewController.swift
//  az-math
//
//  Created by Vali, Riyaz on 10/26/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    public weak var delegate: PopOverViewControllerDelegate?
    private let successMessages: [String] = ["Awesome", "Great Job", "Excellent", "Fantastic" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message?.text = successMessages[Int(arc4random_uniform(UInt32(successMessages.count)))] + " 👍 👍 👍"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func dismiss(_ sender: UIButton) {
        delegate?.viewDismissed()
        self.dismiss(animated: true, completion: nil)
    }
}
