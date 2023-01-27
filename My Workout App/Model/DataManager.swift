//
//  DataManager.swift
//  My Workout App
//
//  Created by Kamil Caglar on 27/01/2023.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Workout")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func exercise(title: String, image: String) -> Exercises {
        let exer = Exercises(context: persistentContainer.viewContext)
        exer.title = title
        exer.image = image
        return exer
    }
    
    func exercises() -> [Exercises] {
        let request: NSFetchRequest<Exercises> = Exercises.fetchRequest()
        var fetchedExercises: [Exercises] = []
        
        do{
            fetchedExercises = try persistentContainer.viewContext.fetch(request)
        }catch {
            print("Error fetching exercises")
        }
        return fetchedExercises
    }
    
    // MARK: - Core Data Saving support

    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
}
