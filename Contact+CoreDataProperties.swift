//
//  Contact+CoreDataProperties.swift
//  MyContacts
//
//  Created by cis290 on 11/21/16.
//  Copyright © 2016 Chuck Konkol. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var descrip: String?
    @NSManaged var titles: String?
    @NSManaged var misc: String?

}
