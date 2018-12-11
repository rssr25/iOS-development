//
//  CategoryViewController.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 11/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
            let newCategory = Category(context: self.context)
            newCategory.name = newItemTextField.text!
            self.categoryArray.append(newCategory)
            //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.saveData()
            
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
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    //MARK: - TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow
        {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - TableView manipulation methods
    
    func saveData()
    {
        do
        {
            try context.save()
        }catch
        {
            print("Error saving context \(error)")
        }
    }
    
    func loadCategories(with request : NSFetchRequest<Category> = Category.fetchRequest())
    {
        
        do
        {
            categoryArray =  try context.fetch(request)
        }
        catch
        {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }
    

}
