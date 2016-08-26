//
//  FormController.swift
//  TodoQueue
//
//  Created by Otto Jursch on 8/21/16.
//  Copyright © 2016 otoo jaursk. All rights reserved.
//

import UIKit

class FormController : UIViewController{
    
    var task : Task? {
        didSet{
            if task != nil{
                navigationItem.title = task?.name
            }
            else{
                navigationItem.title = "New Task"
            }
        }
    }
    
    @IBOutlet var nameField :UITextField!
    
    @IBOutlet var priorityField: UITextField!
    
    @IBOutlet var timePicker: UIDatePicker!
    
    @IBOutlet var deadlinePicker: UIDatePicker!
    
    @IBAction func dismissKeyboard(sender : AnyObject){
        nameField.resignFirstResponder()
        priorityField.resignFirstResponder()
    }
    
    @IBAction func addTask(){
        let taskName : String? = nameField.text
        let priority : String? = priorityField.text
        let deadline : NSDate = deadlinePicker.date
        let time : Double = timePicker.countDownDuration
        task = Task(dead: deadline, duration: time, title: taskName!, importance: priority!)
        navigationController?.popToRootViewController(animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        if let tbc = self.tabBarController as? TodoQueueTabController{
            tbc.tasks.append(task!)
        }
        else{
            print("FAILURE TO DO SOMETHING")
        }
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.plain, target: self, action:#selector(FormController.addTask))
        if task != nil{
            navigationItem.rightBarButtonItem?.title = "Edit"
            deadlinePicker.date = (task?.deadline)! as Date
            timePicker.countDownDuration = (task?.time)!
            nameField.text = task?.name
            priorityField.text = String(task?.priority)
        }
    }
    
}
