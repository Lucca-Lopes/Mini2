//
//  PrefsUserDefault.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 21/11/22.
//

import Foundation

class PrefsUserDefault {
    
    let userDefaults = UserDefaults.standard
    
    var primeiroUso: Bool = true
    var moedas: Int = 0
    
    var mausoleus: [Bool] = []
    var covas: [Bool] = []
    
    init(){
//        verificaPrimeiroUso()
        zerarUD()
        carregarJogo()
    }
    
    func carregarJogo(){
        carregarMoedas()
        carregarMausoleus()
        carregarCovas()
    }
    
    func carregarMoedas(){
        if let load = userDefaults.value(forKey: "moedas") as? Int {
            moedas = load
        }
        else {
            moedas = 0
        }
    }
    
    func carregarMausoleus(){
        if let load = userDefaults.value(forKey: "mausoleus") as? [Bool] {
            mausoleus = load
        }
        else {
            mausoleus = [true, false, false, false, false, false]
        }
        
    }
    
    func carregarCovas(){
        if let load = userDefaults.value(forKey: "covas") as? [Bool] {
            covas = load
        }
        else {
            covas = [true, false, false, false, false, false, false, false, false, false, false, false]
        }
    }
    
    func zerarUD(){
        userDefaults.setValue(0, forKey: "moedas")
        userDefaults.setValue([true, false, false, false, false, false], forKey: "mausoleus")
        userDefaults.setValue([true, false, false, false, false, false, false, false, false, false, false, false], forKey: "covas")
    }
    
//    func verificaPrimeiroUso(){
//        if let load = UserDefaults().value(forKey: "primeiroUso") as? Bool {
//            primeiroUso = load
//        }
//        else {
//            primeiroUso = true
//        }
//    }
}
