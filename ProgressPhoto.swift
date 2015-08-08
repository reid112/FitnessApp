//
//  ProgressPhoto.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-08.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import CoreData

@objc(ProgressPhoto)
class ProgressPhoto: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var photo: NSData

}
