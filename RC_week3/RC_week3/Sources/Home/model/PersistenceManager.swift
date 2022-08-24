//
//  PersistenceManager.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/24.
//

import Foundation
import UIKit
import CoreData


class PersistenceManager : NSPersistentContainer{
    static var shared: PersistenceManager = PersistenceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HomeTable")
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }

    
    func create(contents: Contents) -> Void {
        let entity = NSEntityDescription.entity(forEntityName: "HomeTable", in: self.context)
            
        if let entity = entity {
            let manageObject = NSManagedObject(entity: entity, insertInto: self.context)
            manageObject.setValue(contents.title, forKey: "title")
            manageObject.setValue(contents.contents, forKey: "contents")
            manageObject.setValue(contents.buy, forKey: "buy")
            manageObject.setValue(contents.like, forKey: "like")
            manageObject.setValue(contents.userLike, forKey: "userLike")
            manageObject.setValue(contents.state, forKey: "state")
        }
        
    }
        
    func read() -> [Contents] {
        let readRequest = NSFetchRequest<NSManagedObject>(entityName: "HomeTable")
            
        let contentsData = try! context.fetch(readRequest)
        
        var dataToContents = [Contents]()
            
        for data in contentsData{
            let title = data.value(forKey: "title") as! String
            let contents = data.value(forKey: "contents") as! String
            let buy = data.value(forKey: "buy") as! Int64
            let like = data.value(forKey: "like") as! Int64
            let userLike = data.value(forKey: "userLike") as! Bool
            let state = data.value(forKey: "state") as! Int64
                
            dataToContents.append(Contents(title: title, contents: contents, buy: buy, like: like, userLike: userLike, state: state))
            }
            
        return dataToContents
    }
    
    
    func update(contents : Contents) -> Contents {
        return contents
    }
    
    func delete(contents : Contents) -> Bool {
        
        return true
    }
}
