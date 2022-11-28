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
    
    let prefsUserDefault = PrefsUserDefault()
    
    @Published var moedas: Int = 0
    @Published var mausoleus: [Bool] = []
    @Published var covas: [Bool] = []
    
    init(){
        moedas = prefsUserDefault.moedas
        mausoleus = prefsUserDefault.mausoleus
        covas = prefsUserDefault.covas
    }
    
    public func salvarMoedas(){
        prefsUserDefault.userDefaults.setValue(moedas, forKey: "moedas")
    }
    
    public func salvarMausoleus(){
        prefsUserDefault.userDefaults.setValue(mausoleus, forKey: "mausoleus")
    }
    
    public func salvarCovas(){
        prefsUserDefault.userDefaults.setValue(covas, forKey: "covas")
    }
}
