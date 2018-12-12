//
//  CategoryViewController.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 11/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    var categoryArray : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        var newItemTextField = UITextField()
        let action = UIAlertAction(title: "Add Category", style: .default)
        { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            let newCategory = Category()
            newCategory.name = newItemTextField.text!
            //self.categoryArray.append(newCategory)
            //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.saveData(category: newCategory)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Item"
            newItemTextField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView Datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No category added yet"
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    //MARK: - TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow
        {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    //MARK: - TableView manipulation methods
    
    func saveData(category : Category)
    {
        do
        {
            try realm.write {
                realm.add(category)
            }
        }catch
        {
            print("Error saving context \(error)")
        }
    }
    
    func loadCategories()
    {
    
        categoryArray = realm.objects(Category.self)

        tableView.reloadData()
    }
    

}
