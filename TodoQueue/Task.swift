//
//  Task.swift
//  TodoQueue
//
//  Created by Otto Jursch on 8/21/16.
//  Copyright © 2016 otoo jaursk. All rights reserved.
//

import Foundation

struct Task{
    var deadline :NSDate
    var time : Double
    var name : String
    var priority: Int
    
    init(dead: NSDate, duration:Double, title: String, importance: String) {
        deadline = dead
        time = duration
        name = title
        priority = (importance as NSString).integerValue
    }
}
