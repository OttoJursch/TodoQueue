//
//  FormController.swift
//  TodoQueue
//
//  Created by Otto Jursch on 8/21/16.
//  Copyright © 2016 otoo jaursk. All rights reserved.
//

import UIKit

class FormController : UIViewController{
    
    @IBOutlet var nameField :UITextField!
    
    @IBOutlet var priorityField: UITextField!
    
    @IBOutlet var timePicker: UIDatePicker!
    
    @IBOutlet var deadlinePicker: UIDatePicker!
    
    @IBAction func addTask(){
        let taskName : String? = nameField.text
        let priority : String? = priorityField.text
        let deadline : NSDate = deadlinePicker.date
        let time : Double = timePicker.countDownDuration
        let task = Task(dead: deadline, duration: time, title: taskName!, importance: priority!)
        if let tbc = self.tabBarController as? TodoQueueTabController{
            tbc.tasks.append(contentsOf: [task])
        }
        else{
            print("FAILURE TO DO SOMETHING")
        }
    }
    
}
