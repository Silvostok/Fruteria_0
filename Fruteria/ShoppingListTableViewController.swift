//
//  ShoppingListTableViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, DataStoreOwner {
  
  var dataStore : DataStore?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 70
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataStore?.shoppingLists.count ?? 0
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ShoppingListCell", forIndexPath: indexPath)
    
    if let cell = cell as? ShoppingListTableViewCell {
      cell.shoppingList = dataStore?.shoppingLists[indexPath.row]
    }
    
    return cell
  }
  
  // MARK: - Table view delegate
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      if let shoppingList = dataStore?.shoppingLists[indexPath.row] {
        dataStore?.removeShoppingList(shoppingList)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      }
    }
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destVC = segue.destinationViewController as? ShoppingListViewController {
      let selectedRowIndex = tableView.indexPathForSelectedRow
      destVC.shoppingList = dataStore?.shoppingLists[selectedRowIndex?.row ?? 0]
      destVC.dataStore = dataStore
    } else if let destVC = segue.destinationViewController as? CreateShoppingListViewController {
      destVC.dataStore = dataStore
    }
  }

  
 

}
