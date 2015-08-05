//
//  User.swift
//  
//
//  Created by Riley Reid on 2015-08-04.
//
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var heightInches: NSNumber
    @NSManaged var weight: NSNumber
    @NSManaged var age: NSNumber
    @NSManaged var gender: NSNumber
    @NSManaged var times_per_week: NSNumber
    @NSManaged var goals: NSNumber
    @NSManaged var heightFeet: NSNumber

}
