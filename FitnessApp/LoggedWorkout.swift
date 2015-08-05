//
//  LoggedWorkout.swift
//  
//
//  Created by Riley Reid on 2015-08-04.
//
//

import Foundation
import CoreData

class LoggedWorkout: NSManagedObject {

    @NSManaged var exercise: String
    @NSManaged var sets: NSNumber
    @NSManaged var reps: NSNumber
    @NSManaged var weight: NSNumber
    @NSManaged var date: NSDate

}
