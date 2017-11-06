//
//  ToDoTableViewController.swift
//  Done
//
//  Created by Mars on 11/3/17.
//  Copyright © 2017 anz-apps. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!

    var model = ToDoViewModel()
    var currentTodo = ToDoItem()

    @IBAction func barButtonAction(_ sender: UIButton) {
        print("\(sender.currentTitle!), \(sender.tag)")
        if sender.currentTitleColor == Constants.HighlightColor {
            sender.setTitleColor(Constants.UnhighlightColor, for: .normal)
        } else {
            sender.setTitleColor(Constants.HighlightColor, for: .normal)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("\(sender.currentTitle!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sortButton?.setFAIcon(icon: .FASort, forState: .normal)
        self.settingsButton?.setFAIcon(icon: .FACogs, forState: .normal)
        self.refreshButton?.setFAIcon(icon: .FARefresh, forState: .normal)
        self.refreshButton?.tintColor = Constants.UnhighlightColor

        self.sortButton?.setTitleColor(Constants.HighlightColor, for: .normal)
        self.settingsButton?.setTitleColor(Constants.HighlightColor, for: .normal)
        self.refreshButton?.setTitleColor(Constants.HighlightColor, for: .normal)

        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.reloadData()
        print ("\(model)")

        // setup observer to reload data
        NotificationCenter.default.addObserver(self, selector: #selector(notificationHandler(_:)), name: NSNotification.Name(rawValue: "todoUpdated"), object: nil)
    }

    @objc func notificationHandler(_ notification: Notification){

        print ("In ToDoTableViewController.notificationHandler - \(notification)")
        model.update(notification.userInfo!)
        print ("\(model.todos)")
        model.sort()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.todos.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.todos[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(model.todos[section].count) - " + model.sectionHeaders[section]
    }

//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "\(model.todos[section].count)"
//    }
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCellIdentifier", for: indexPath)

        // Configure the cell...
        if let todoCell = cell as? ToDoTableViewCell {
            let id = model.todos[indexPath.section][indexPath.row]
            todoCell.todo = model.getTodo(id)

            return todoCell
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
    }

//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
