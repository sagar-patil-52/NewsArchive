//
//  StorageHandler.swift
//  NewsArchives
//
//  Created by Shaunak Jagtap on 09/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation
import CoreData

class StorageHandler {
    
    static let shared = StorageHandler()
    
    init(){}
    
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "NewsArchives")
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
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
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
  
    func storeData(agency:Agency)
    {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AgencyEntity", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(agency.title, forKey: "title")
        newUser.setValue(agency.publisher, forKey: "publisher")
        newUser.setValue(agency.city?[0], forKey: "region")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func getStoredAgencies() -> Array<Agency> {
        
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AgencyEntity")
//        request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            var agencyArr : [Agency] = []
            
            
            for data in result as! [NSManagedObject] {
                
        
                let  title = data.value(forKey: "title") as! String
                print(title)
                let publisher = data.value(forKey: "publisher") as! String
                print(publisher)
                var language = ""
                if data.value(forKey: "language") != nil {
                    language = data.value(forKey: "language") as! String
                }
                let region = data.value(forKey: "region") as! String
                let agency = Agency.init(start_year: 0, essay:"", title: title, publisher: publisher, language: [language], city: [region])
                
                agencyArr.append(agency)
    
            }
            
            return agencyArr
            
        } catch {
            
            print("Failed")
        }
        
        return []
    }
    
    func deleteAgency(title:String)
    {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AgencyEntity")
        request.predicate = NSPredicate(format: "title = %@", title)
        request.returnsObjectsAsFaults = false
        
        do
        {
            let test = try context.fetch(request)
            
            let objectToDelete = test[0] as! NSManagedObject
            context.delete(objectToDelete)
            
            do{
                try context.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
    }
}
