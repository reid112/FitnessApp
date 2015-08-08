//
//  User.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-08.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    @NSManaged var age: NSNumber
    @NSManaged var gender: NSNumber
    @NSManaged var goals: NSNumber
    @NSManaged var heightFeet: NSNumber
    @NSManaged var heightInches: NSNumber
    @NSManaged var times_per_week: NSNumber
    @NSManaged var weight: NSNumber

}
