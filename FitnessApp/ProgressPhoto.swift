//
//  ProgressPhoto.swift
//  
//
//  Created by Riley Reid on 2015-08-03.
//
//

import Foundation
import CoreData

class ProgressPhoto: NSManagedObject {

    @NSManaged var photo: NSData
    @NSManaged var date: NSDate

}