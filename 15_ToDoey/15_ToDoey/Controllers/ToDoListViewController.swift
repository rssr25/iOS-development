//
//  ViewController.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 04/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {

    //var itemArray = ["Rubberband your wig", "Slap the bitch", "Bon Appetite your man"]
    var toDoItems : Results<Item>?
    let realm = try! Realm()
    var selectedCategory : Category?
    {
        didSet
        {
            loadItems()
        }
    }
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        print(dataFilePath!)
        
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        toDoItems.append(newItem)
//        
//        let newItem2 = Item()
//        newItem2.title = "Find Mike"
//        toDoItems.append(newItem2)
//        
//        let newItem3 = Item()
//        newItem3.title = "Find Mike"
//        toDoItems.append(newItem3)
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]
//        {
//            toDoItems = items
//        }
    }

    //MARK: Tableview Data source methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item = toDoItems?[indexPath.row]
        {
            cell.textLabel?.text = item.title
            
            cell.accessoryType = item.done == true ? .checkmark : .none
        }
        else
        {
            cell.textLabel?.text = "No Items Added"
        }
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems?.count ?? 1
    }
    
    
    
    
    //MARK: Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = toDoItems?[indexPath.row]
        {
            do
            {
                try realm.write {
                    item.done = !item.done
                }
            }
            catch
            {
                print("Erroe saving done status \(error)")
            }
        }
        
        tableView.reloadData()
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
            
            if let currentCategory = self.selectedCategory
            {
                do
                {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = newItemTextField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                }
                
                catch
                {
                    print("error saving new items: \(error)")
                }
            }

            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Item"
            newItemTextField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    
    func loadItems()
    {
        toDoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

        tableView.reloadData()
    }
    
}

//MARK: - Search bar methods
extension ToDoListViewController : UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        toDoItems = toDoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0
        {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
    }
}

