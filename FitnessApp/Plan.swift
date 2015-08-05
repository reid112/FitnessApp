//
//  Plan.swift
//  
//
//  Created by Riley Reid on 2015-08-04.
//
//

import Foundation
import CoreData

class Plan: NSManagedObject {

    @NSManaged var day: NSNumber
    @NSManaged var exercise: String
    @NSManaged var sets: NSNumber
    @NSManaged var reps: NSNumber

}
