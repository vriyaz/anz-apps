//
//  RhymingWordsViewController.swift
//  az-words
//
//  Created by Vali, Riyaz on 10/25/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class RhymingWordsViewController: UIViewController {

    var currentWord: String = "" {
        didSet {
            word.text = currentWord
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var rhymingWords = ["cab":"lab", "main":"pain", "bank":"sank", "feed":"speed", "back":"pack", "bake":"cake", "cap":"lap", "bell":"fell", "find":"kind", "cold":"hold", "know":"show"]
    var randomWords = ["czar", "race", "wites", "yank", "twin", "like", "help", "true", "punt", "cute", "dose", "deny", "ease", "sped", "news", "note", "live", "with", "time", "this", "castle", "view", "word", "lose", "game", "man", "found", "home", "made", "medium", "over", "sport", "health", "tech", "about"]

    @IBOutlet weak var word: UILabel!

    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!


    @IBAction func optionSelected(_ sender: UIButton) {
        let option = sender.currentTitle ?? "nothing"
        print("\(option)")
        if option == rhymingWords[currentWord] {
            print ("words match")
        } else {
            print ("tough luck, try again!")
        }
    }

    private func setUpWords() {
        let index = Int(arc4random_uniform(UInt32(rhymingWords.count)))
        currentWord = Array (rhymingWords.keys)[index]

        // set some random values
        option1.setTitle(randomWords[Int(arc4random_uniform(UInt32(randomWords.count)))], for: .normal)
        option2.setTitle(randomWords[Int(arc4random_uniform(UInt32(randomWords.count)))], for: .normal)
        option3.setTitle(randomWords[Int(arc4random_uniform(UInt32(randomWords.count)))], for: .normal)
        option4.setTitle(randomWords[Int(arc4random_uniform(UInt32(randomWords.count)))], for: .normal)

        let correctOptionIndex = Int(arc4random_uniform(4))
        print("correctOptionIndex = \(correctOptionIndex)")

        switch correctOptionIndex {
        case 0:
            option1.setTitle(rhymingWords[currentWord], for: .normal)
        case 1:
            option2.setTitle(rhymingWords[currentWord], for: .normal)
        case 2:
            option3.setTitle(rhymingWords[currentWord], for: .normal)
        default:
            option4.setTitle(rhymingWords[currentWord], for: .normal)
        }

    }
    @IBAction func nextWord(_ sender: UIButton) {
        setUpWords()
    }
}
