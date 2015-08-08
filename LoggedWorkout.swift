//
//  LoggedWorkout.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-08.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import CoreData

@objc(LoggedWorkout)
class LoggedWorkout: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var exercise: String
    @NSManaged var reps: NSNumber
    @NSManaged var sets: NSNumber
    @NSManaged var weight: NSNumber

}
