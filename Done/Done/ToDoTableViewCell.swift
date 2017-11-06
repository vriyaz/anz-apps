//
//  ToDoTableViewCell.swift
//  Done
//
//  Created by Mars on 11/3/17.
//  Copyright © 2017 anz-apps. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urgentButton: UIButton!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        notify(self.todo!, forAction: "done")
    }

    @IBAction func urgentButtonPressed(_ sender: UIButton) {
        notify(self.todo!, forAction: "urgent")
    }

    @IBAction func importantButtonPressed(_ sender: UIButton) {
        notify(self.todo!, forAction: "important")
    }

    func notify(_ todo: ToDoItem, forAction action: String) {
        var changes: [String:Any] = [:]
        changes["todo"] = todo
        changes["action"] = action
        print ("In ToDoTableViewCell.notify ... \(changes)")

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "todoUpdated"), object: nil, userInfo: changes)
    }

    var todo: ToDoItem? {
        didSet {
            updateUI()
        }
    }

    private func setFontColor(_ state: Bool, forButtonNamed button: UIButton?) {
        let color = state ? Constants.HighlightColor : Constants.UnhighlightColor
        button?.setTitleColor(color, for: .normal)
    }

    private func updateUI() {

        if let item = self.todo {
            self.titleLabel?.text = item.description

            setFontColor(item.done, forButtonNamed: self.doneButton)
            setFontColor(item.isImportant, forButtonNamed: self.importantButton)
            setFontColor(item.isUrgent, forButtonNamed: self.urgentButton)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.urgentButton?.setFAIcon(icon: .FAClockO, forState: .normal)
        self.importantButton?.setFAIcon(icon: .FAExclamationCircle, forState: .normal)
        self.doneButton?.setFAIcon(icon: .FACheckCircle, forState: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
