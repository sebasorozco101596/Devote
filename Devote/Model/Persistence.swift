//
//  Persistence.swift
//  Devote
//
//  Created by Juan Sebastian Orozco Buitrago on 2/10/22.
//

import CoreData

struct PersistenceController {
    
    //MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()

    //MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    //MARK: - 3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    //MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        
        let result = PersistenceController(inMemory: true)
        
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
