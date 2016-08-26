//
//  Date.swift
//  TodoQueue
//
//  Created by Otto Jursch on 8/21/16.
//  Copyright © 2016 otoo jaursk. All rights reserved.
//

import Foundation

public func ==(lhs : NSDate, rhs:NSDate) -> Bool{
    return lhs == rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs : NSDate, rhs:NSDate) -> Bool{
    return lhs.compare(rhs as Date) == .orderedAscending
}

extension NSDate : Comparable{
}
