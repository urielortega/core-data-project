//
//  DataController.swift
//  CoreDataProject
//
//  Created by Uriel Ortega on 05/06/23.
//

import Foundation

import CoreData
import Foundation

class DataController: ObservableObject {
    // This container prepares CoreData to load the data in CoreDataProject datamodel.
    let container = NSPersistentContainer(name: "CoreDataProject") // This means: Use CoreDataProject.xcdatamodel
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
