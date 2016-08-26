//
//  TaskListController.swift
//  TodoQueue
//
//  Created by Otto Jursch on 8/21/16.
//  Copyright © 2016 otoo jaursk. All rights reserved.
//

import UIKit
import Foundation

class TaskListController: UITableViewController{
    
    @IBOutlet var editButton :UIBarButtonItem!
    
    @IBAction func toggleEditing(sender:AnyObject){
        if isEditing{
            editButton.title = "Edit"
            isEditing = false
        }
        else{
            editButton.title = "Done"
            isEditing = true
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let tabber : TodoQueueTabController = self.tabBarController as? TodoQueueTabController{
                tabber.tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView : UITableView, numberOfRowsInSection : Int) -> Int{
        if let tabber : TodoQueueTabController = self.tabBarController as? TodoQueueTabController{
            return tabber.tasks.count
        }
        else{
            return 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextController = segue.destinationViewController as! FormController
        if segue.identifier == "AddSegue"{
            nextController.navigationItem.title = "New Item"
            nextController.navigationItem.backBarButtonItem?.title = "Cancel"
        }
        else if segue.identifier == "EditSegue"{
            if let row = tableView.indexPathForSelectedRow?.row{
                nextController.task = (tabBarController as? TodoQueueTabController)?.tasks[row]
                (tabBarController as? TodoQueueTabController)?.tasks.remove(at: row)
            }
        }
    }
    
    override func viewDidLoad() {
        let statusBarHeight = UIApplication.shared().statusBarFrame.height
        let insets = UIEdgeInsets(top : statusBarHeight, left: 0, bottom : 0, right : 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        if let tabber : TodoQueueTabController = self.tabBarController as? TodoQueueTabController{
            print(tabber.tasks[indexPath.row].name)
            print(tabber.tasks[indexPath.row].deadline)
            print(indexPath.row)
            cell.textLabel?.text = tabber.tasks[indexPath.row].name
            let date :NSDate = tabber.tasks[indexPath.row].deadline
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.locale = Locale(localeIdentifier: "en_US")
            cell.detailTextLabel?.text = dateFormatter.string(from: date as Date)
        }
        return cell
    }
}
