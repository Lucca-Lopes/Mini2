//
//  PrefsUserDefault.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 21/11/22.
//

import Foundation

class PrefsUserDefault {
    var moedas: Int = 0
    var primeiroUso: Bool = true
    
    init(){
        carregarMoedas()
        verificaPrimeiroUso()
    }
    
    func carregarMoedas(){
        if let load = UserDefaults().value(forKey: "moedas") as? Int {
            moedas = load
        }
        else {
            moedas = 0
        }
    }
    
    func verificaPrimeiroUso(){
        if let load = UserDefaults().value(forKey: "primeiroUso") as? Bool {
            primeiroUso = load
        }
        else {
            primeiroUso = true
        }
    }
    
}
