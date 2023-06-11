//
//  Persistence.swift
//  StepByStep
//
//  Created by Janet on 7/6/2023.
//

import Foundation
import CoreData


/**
 The `PersistenceController` class manages the Core Data stack and provides a shared instance for accessing the data store.
 
 Use this controller class to interact with Core Data and perform operations such as initializing the persistent container, loading persistent stores, and saving changes to the managed object context.
 
 */


class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    // MARK: - Initialization

    init() {
        container = NSPersistentContainer(name: "HabitDataModel") // Replace "HabitDataModel" with data model name
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    
    // MARK: - Saving

    /**
     Saves changes to the Core Data context.
     
     If there are changes in the context, it attempts to save them. If an error occurs during saving, it raises a fatal error with the error information.
     
     Make sure to call this method whenever you want to persist changes made to Core Data entities.
     
     Usage:
     ```
     PersistenceController.shared.save()
     ```
     */
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
