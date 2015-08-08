//
//  PlanPart.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-08.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import CoreData

@objc(PlanPart)
class PlanPart: NSManagedObject {

    @NSManaged var day: NSNumber
    @NSManaged var exercise: String
    @NSManaged var reps: NSNumber
    @NSManaged var sets: NSNumber

}
