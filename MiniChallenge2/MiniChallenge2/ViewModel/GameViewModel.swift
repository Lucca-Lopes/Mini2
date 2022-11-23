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
    
    @Published var moedas: Int = 0
    @Published var covas: [Cova] = []
    @Published var mausoleus: [Mausoleu] = []
    
    init(){
        if (prefsUserDefault.primeiroUso){
            gerarEstruturas()
        }
        else {
            carregarMausoleus()
            carregarCovas()
            moedas = prefsUserDefault.moedas
        }
        print(mausoleus)
        print(covas)
    }
    
    private func salvar(){
        manager.salvar()
        prefsUserDefault.carregarMoedas()
        carregarMausoleus()
        carregarCovas()
    }
    
    private func carregarMausoleus() {
        let request = NSFetchRequest<Mausoleu>(entityName: "Mausoleu")
        
        do {
            mausoleus = try manager.context.fetch(request)
        } catch let erro {
            print("Erro ao fazer o fetch de mausoleus. \(erro)")
        }
    }

    private func carregarCovas() {
        let request = NSFetchRequest<Cova>(entityName: "Cova")
        
        do {
            covas = try manager.context.fetch(request)
        } catch let erro {
            print("Erro ao fazer o fetch de covas. \(erro)")
        }
    }

    public func atualizarMoedas(quantia: Int){
        defaults.set(quantia, forKey: "moedas")
        prefsUserDefault.carregarMoedas()
    }
    
    private func gerarEstruturas(){
        let mausoleu1 = gerarMausoleu(nome: "pobre", preco: 100)
        let mausoleu2 = gerarMausoleu(nome: "pobre", preco: 100)
        let mausoleu3 = gerarMausoleu(nome: "pobre", preco: 100)
        let mausoleu4 = gerarMausoleu(nome: "pobre", preco: 100)
        let mausoleu5 = gerarMausoleu(nome: "pobre", preco: 100)
        let mausoleu6 = gerarMausoleu(nome: "pobre", preco: 100)
        
        let m1Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m1Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m2Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m2Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m3Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m3Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m4Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m4Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m5Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m5Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m6Cova1 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        let m6Cova2 = gerarCova(nome: "pobre", preco: 100, moedasGanhas: 5, tempoDeRecarga: 5)
        
        mausoleu1.covas = [m1Cova1, m1Cova2]
        mausoleu2.covas = [m2Cova1, m2Cova2]
        mausoleu3.covas = [m3Cova1, m3Cova2]
        mausoleu4.covas = [m4Cova1, m4Cova2]
        mausoleu5.covas = [m5Cova1, m5Cova2]
        mausoleu6.covas = [m6Cova1, m6Cova2]
        
        mausoleus = [mausoleu1, mausoleu2, mausoleu3, mausoleu4, mausoleu5, mausoleu6]
        covas = [m1Cova1, m1Cova2, m2Cova1, m2Cova2, m3Cova1, m3Cova2, m4Cova1, m4Cova2, m5Cova1, m5Cova2, m6Cova1, m6Cova2]
        
        salvar()
    }
    
    private func gerarMausoleu(nome: String, preco: Int64) -> Mausoleu{
        let mausoleu = Mausoleu(context: manager.context)
        mausoleu.nome = nome
        mausoleu.preco = preco
        return mausoleu
    }
    
    private func gerarCova(nome:String, preco: Int64, moedasGanhas: Int64, tempoDeRecarga: Double) -> Cova{
        let cova = Cova(context: manager.context)
        cova.nome = nome
        cova.preco = preco
        cova.moedasGanhas = moedasGanhas
        cova.tempoDeRecarga = tempoDeRecarga
        return cova
    }
    
}
