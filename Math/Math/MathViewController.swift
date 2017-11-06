//
//  MathViewController.swift
//  az-math
//
//  Created by Vali, Riyaz on 10/23/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class MathViewController: UIViewController, PopOverViewControllerDelegate {

    @IBOutlet weak var operand1: UILabel!
    @IBOutlet weak var operand2: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var result: UILabel!
    
    public var mathOperation: String = "+"
    
    let userDefaults: UserDefaults = UserDefaults.standard

    var currentResult: String = "?" {
        didSet {
            let op1 = Int(operand1.text!) ?? 0
            let op2 = Int(operand2.text!) ?? 0
            
            var answer: Int = 0;
            
            switch operation.text! {
                case "+": answer = op1 + op2
                case "−": answer = op1 - op2
                case "×": answer = op1 * op2
                case "÷": answer = op1 / op2
                default: answer = 0
            }
            
            if (answer == Int(currentResult)) {
                result.backgroundColor = UIColor.init(red: 2.0/255, green: 132.0/255, blue: 1.0/255, alpha: 1.0) // clover/green
                result.textColor = UIColor.white
                //showConfirmationAlert()
                //self.performSegue(withIdentifier: "showPopOver", sender: self)
                showPopOver()
            } else {
                result.backgroundColor = UIColor.red
                result.textColor = UIColor.white
            }
            result.text = currentResult
        }
    }
    
    private func showPopOver() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alertViewController = storyboard.instantiateViewController(withIdentifier: "alert")
//        alertViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        alertViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        if let vc = alertViewController as? PopOverViewController {
            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

            vc.delegate = self
            self.present(vc, animated: true, completion: nil)

        }
    }
    
    private func showConfirmationAlert() {
        let alert = UIAlertController(title: "Good Job!", message: "That was awesome", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionPressed(_ sender: UIRoundButton) {
        let action = sender.currentTitle!
        print ("action pressed - \(action)")
        
        if action == "✘" {
            currentResult = "?"
        } else if action == "➡︎" {
            newPuzzle()
        }
    }
    
    public func newPuzzle() {
        
        var op1 = arc4random_uniform(5)
        var op2 = arc4random_uniform(5)

        switch userDefaults.integer(forKey: "level") {
        case 0:
            break
        case 1:
            op1 = arc4random_uniform(10)
        case 2:
            op1 = arc4random_uniform(10)
            op2 = arc4random_uniform(10)
        default:
            break
        }
        
        currentResult = "?"
        
        switch operation.text! {
        case "+":
            operand1.text = String(max(op1, op2))
            operand2.text = String(min(op1, op2))
        case "−":
            operand1.text = String(max(op1, op2))
            operand2.text = String(min(op1, op2))
        case "×":
            operand1.text = String(max(op1, op2))
            operand2.text = String(min(op1, op2))
        case "÷":
            operand1.text = String(op1 * op2)
            operand2.text = String(max(min(op1, op2), 1)) // max (x,1) to avoid divide by zero errors
        default:
            operand1.text = String(op1)
            operand2.text = String(op2)
        }
    }
    
    @IBAction func digitPressed(_ sender: UIRoundButton) {
        let number = sender.currentTitle!
        
        if currentResult == "?" {
            currentResult = number
        } else {
            if currentResult.count == 1 {
                currentResult += number
            } else {
                currentResult = String(currentResult.last!) + number
            }
            if String(currentResult.first!) == "0" {
                currentResult = String(currentResult.last!)
            }
        }
        print ("number pressed - \(sender.currentTitle!) \(currentResult)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operation.text = mathOperation
        result.textColor = UIColor.red
        let level = userDefaults.integer(forKey: "level")
        print("mathViewController.level: \(level)")
        newPuzzle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopOver" {
            if let destination = segue.destination as? PopOverViewController {
                destination.preferredContentSize = CGSize(width: 200, height: 200)
                destination.delegate = self
            }
        }
    }
    
    func viewDismissed() {
        newPuzzle()
    }
}
