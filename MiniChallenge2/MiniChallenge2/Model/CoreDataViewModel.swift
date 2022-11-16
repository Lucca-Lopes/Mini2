//
//  CoreDataViewModel.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 16/11/22.
//

import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var moedas: [Moedas] = []
    
    init(){
        container = NSPersistentContainer(name: "Container")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Erro ao carregar container: \(error)")
            }
        }
        fetchMoedas()
    }
    
    func fetchMoedas() {
        let request = NSFetchRequest<Moedas>(entityName: "Moedas")
        
        do {
            try container.viewContext.fetch(request)
        } catch let erro {
            print("Erro ao carregar moedas \(erro)")
        }
    }
}
