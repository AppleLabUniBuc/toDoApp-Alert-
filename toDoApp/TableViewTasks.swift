//
//  TableViewTasks.swift
//  toDoApp
//
//  Created by Cosmin Daniel Nedelea on 08/04/2017.
//  Copyright © 2017 Cosmin Daniel Nedelea. All rights reserved.
//

import UIKit

class TableViewTasks: UITableViewController {
    
    var tasks = Array<Task>()
    var cellColor = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    var titleField: UITextField!
    var descriptionField: UITextField!
    
    func configurationTextField1(textField: UITextField!) {
        textField?.placeholder = "Title..."
        titleField = textField
    }
    func configurationTextField2(textField: UITextField!) {
        descriptionField?.placeholder = "Description..."
        descriptionField = textField
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let addItemAlert = UIAlertController(title: "Add Category", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        addItemAlert.addTextField(configurationHandler: configurationTextField1)
        addItemAlert.addTextField(configurationHandler: configurationTextField2)
        
        
        addItemAlert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: {(action) in
            let task = Task(title: self.titleField.text!, description: self.descriptionField.text!)
            self.tasks.append(task)
            addItemAlert.dismiss(animated: true, completion: nil)
            self.tableView.reloadData()
        }))
        
        addItemAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        self.present(addItemAlert, animated: true, completion:nil)
        
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
            
        cell.textLabel?.text = tasks[indexPath.row].titleOfTask
        cell.detailTextLabel?.text = tasks[indexPath.row].descriptionOfTask
        cell.backgroundColor = cellColor

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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
