//
//  SightWordViewController.swift
//  az-words
//
//  Created by Vali, Riyaz on 10/25/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

class SightWordViewController: UIViewController {
    
    var sightWords = ["a", "about", "after", "all", "an", "and", "are", "as", "at", "be", "been", "but", "by", "called", "can", "could", "did", "do", "down", "each", "find", "first", "for", "from", "had", "has", "have", "he", "her", "him", "his", "how", "i", "if", "in", "into", "is", "it", "its", "just", "know", "like", "little", "long", "made", "make", "many", "may", "more", "most", "my", "no", "not", "now", "of", "on", "one", "only", "or", "other", "out", "over", "people", "said", "see", "she", "so", "some", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "time", "to", "two", "up", "use", "very", "was", "water", "way", "we", "were", "what", "when", "where", "which", "who", "will", "with", "words", "would", "you", "your"]
    
    private var currentIndex: Int = 0
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBAction func actionPressed(_ sender: UIButton) {
        if let action = sender.currentTitle {
            setWord(withAction: action)
        }
    }
    
    private func setWord(withAction action: String) {
        switch action {
        case "←":
            currentIndex = currentIndex == 0 ? 99 : currentIndex - 1
        case "→":
            currentIndex = currentIndex == 99 ? 0 : currentIndex + 1
        case "⟳":
            currentIndex =  Int(arc4random_uniform(99))
        default: break
        }
        wordLabel.text = sightWords[currentIndex].uppercased()
    }
    
    @IBOutlet weak var sightWordView: SightWordView! {
        didSet {
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeWordOnTap(byReactingTo:)))
            tapRecognizer.numberOfTapsRequired = 1
            sightWordView.addGestureRecognizer(tapRecognizer)
            
            let rightSwipeRecongizer = UISwipeGestureRecognizer(target: self, action: #selector(changeWordOnRightSwipe))
            rightSwipeRecongizer.direction = .right
            sightWordView.addGestureRecognizer(rightSwipeRecongizer)
            
            let leftSwipeRecongizer = UISwipeGestureRecognizer(target: self, action: #selector(changeWordOnLeftSwipe))
            leftSwipeRecongizer.direction = .left
            sightWordView.addGestureRecognizer(leftSwipeRecongizer)
        }
    }
    
    @objc func changeWordOnTap(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            setWord(withAction: "⟳")
        }
    }
    
    @objc func changeWordOnRightSwipe() {
        setWord(withAction: "→")
    }
    
    @objc func changeWordOnLeftSwipe() {
        setWord(withAction: "←")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWord(withAction: "⟳")
    }
}

