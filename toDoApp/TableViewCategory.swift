//
//  TableViewCategory.swift
//  toDoApp
//
//  Created by Cosmin Daniel Nedelea on 08/04/2017.
//  Copyright © 2017 Cosmin Daniel Nedelea. All rights reserved.
//

import UIKit

class TableViewCategory: UITableViewController {
    var categoryItems = Array<Category>();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    var tField: UITextField!
    
    func configurationTextField(textField: UITextField!) {
        textField.placeholder = "Category name..."
        tField = textField
    }

    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        let addItemAlert = UIAlertController(title: "Add Category", message: "", preferredStyle: UIAlertControllerStyle.alert)
       
        addItemAlert.addTextField(configurationHandler: configurationTextField)
        
        
        addItemAlert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: {(action) in
            let category = Category(name: self.tField.text!)
            self.categoryItems.append(category)
            addItemAlert.dismiss(animated: true, completion: nil)
            self.tableView.reloadData()
        }))
        
        addItemAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        self.present(addItemAlert, animated: true, completion:nil)
        
    }
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        cell.textLabel?.text = categoryItems[indexPath.row].name
        cell.detailTextLabel?.text = String(categoryItems[indexPath.row].tasks.count)
        cell.detailTextLabel?.textColor = getRandomColor()

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
            categoryItems.remove(at: indexPath.row)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toTasks" {
            if let destination: TableViewTasks = segue.destination as? TableViewTasks {
                destination.tasks = self.categoryItems[(self.tableView.indexPathForSelectedRow?.row)!].tasks
                destination.cellColor = (self.tableView.cellForRow(at: (self.tableView.indexPathForSelectedRow)!)?.detailTextLabel?.textColor)!
            }
            
        }
    }
    

}

