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
    let prefsUserDefault = PrefsUserDefault()
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    let defaults = UserDefaults.standard
    
    @Published var covas: [Cova] = []
    @Published var mausoleus: [Mausoleu] = []
    
    init(){
        FetchCovas()
        FetchMausoleus()
    }

    private func FetchCovas() {
        let request = NSFetchRequest<Cova>(entityName: "Cova")
        
        do {
            covas = try manager.context.fetch(request)
        } catch let erro {
            print("Erro ao fazer o fetch de covas. \(erro)")
        }
    }

    private func FetchMausoleus() {
        let request = NSFetchRequest<Mausoleu>(entityName: "Mausoleu")
        
        do {
            mausoleus = try manager.context.fetch(request)
        } catch let erro {
            print("Erro ao fazer o fetch de mausoleus. \(erro)")
        }
    }
    
    public func AtualizarMoedas(quantia: Int){
        defaults.set(quantia, forKey: "moedas")
        prefsUserDefault.carregarMoedas()
    }
    
    
    
}
