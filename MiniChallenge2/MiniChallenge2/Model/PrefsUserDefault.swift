//
//  PrefsUserDefault.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 21/11/22.
//

import Foundation

class PrefsUserDefault {
    var moedas: Int = 0
    
    init(){
        carregarMoedas()
    }
    
    func carregarMoedas(){
        if let load = UserDefaults().value(forKey: "moedas") as? Int {
            moedas = load
        }
        else {
            moedas = 0
        }
    }
}
