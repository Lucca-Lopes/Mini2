//
//  CoreDataViewModel.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 16/11/22.
//

import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Container")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Erro ao carregar o Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func salvar() {
        do {
            try context.save()
        } catch let error {
            print("Erro ao salvar o Core Data, \(error.localizedDescription)")
        }
    }
}
