//
//  GameViewModel.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SwiftUI
import CoreData
import SpriteKit

class GameViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var moedas: [Moedas]
    @Published var covas: [Cova] = []
    @Published var mausoleus: [Mausoleu] = []
    
    init(){
        
    }
    
    func FetchMoedas() {
        let request = NSFetchRequest<Moedas>(entityName: "Moedas")
        
        do {
            moedas = try manager.context.fetch(request)
        } catch let erro {
            print("Erro ao fazer o fetch de moedas. \(erro)")
        }
    }
    
}
