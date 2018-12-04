//
//  ViewController.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 04/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Rubberband your wig", "Slap the bitch", "Bon Appetite your man"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK: Tableview Data source methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])

        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK : Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        var newItemTextField = UITextField()
        let action = UIAlertAction(title: "Add Item", style: .default)
        { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.itemArray.append(newItemTextField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Item"
            newItemTextField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

