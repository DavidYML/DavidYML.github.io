//
//  Medicine+Properties.swift
//  MyMedicines
//
//  Created by Development on 4/01/17.
//  Copyright © 2017 Development. All rights reserved.
//

import Foundation
import CoreData

 extension MyMedicine {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyMedicine> {
        return NSFetchRequest<MyMedicine>(entityName: "Medicine");
        
    }
    @objc(addMedicinesObject:)
    @NSManaged public func addToMedicines(_ value: MyMedicine)
    
    @objc(removeMedicinesObject:)
    @NSManaged public func removeFromMedicines(_ value: MyMedicine)
    
    @objc(addMedicines:)
    @NSManaged public func addToMedicines(_ values: NSSet)
    
    @objc(removeMedicines:)
    @NSManaged public func removeFromMedicines(_ values: NSSet)
    
    
    
    
    @NSManaged public var name: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var expiryDate: String?
    @NSManaged public var indication: String?
    @NSManaged public var prescription: Bool
    
    
    
    
}
