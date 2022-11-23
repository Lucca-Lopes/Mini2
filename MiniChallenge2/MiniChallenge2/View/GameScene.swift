//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SpriteKit

class GameScene: SKScene{
    
    let vm = GameViewModel()
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        
        //Em posMausoleu, para criar a área na direita, passa-se 1 como parâmetro do x. Para criar na esquerda, passa-se 3.
        let mausoleu1 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.7), nome: "pobre", entidade: vm.mausoleus[0])
        let mausoleu2 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.45), nome: "artista", entidade: vm.mausoleus[1])
        let mausoleu3 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.2), nome: "militar", entidade: vm.mausoleus[2])
        
        let mausoleu4 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.7), nome: "trabalhador", entidade: vm.mausoleus[3])
        let mausoleu5 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.45), nome: "empresario", entidade: vm.mausoleus[4])
        let mausoleu6 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.2), nome: "rei", entidade: vm.mausoleus[5])
        
        addChild(mausoleu1)
        addChild(mausoleu2)
        addChild(mausoleu3)
        addChild(mausoleu4)
        addChild(mausoleu5)
        addChild(mausoleu6)
        
//        let posCova = CGFloat((131/4)-2)
        
//        let a1 = vm.area(posX: 1, posY: 0.75)
//        let c1 = vm.cova(pos: a1.position, sep: -posCova, nome: "PobreG")
//        let c2 = vm.cova(pos: a1.position, sep: posCova, nome: "EmpresarioG")
//        vm.fantasminha(pos: c1.position, nome: "PobreG")
//        vm.fantasminha(pos: c2.position, nome: "EmpresarioG")
        
//        vm.area(posX: 1, posY: 0.5)
//        vm.area(posX: 1, posY: 0.25)
        
//        addChild(a1)
//        addChild(c1)
//        addChild(c2)
//        addChild(vm.fantasminha(pos: c1.position, nome: "PobreG"))
//        addChild(vm.fantasminha(pos: c2.position, nome: "EmpresarioG"))
        
        
        
//        area(posX: 3, posY: 2.7)
//        area(posX: 3, posY: 4.4)
//        area(posX: 3, posY: 6.1)
//
//        area(posX: 1, posY: 1)
//        area(posX: 1, posY: 2.7)
//        area(posX: 1, posY: 4.4)
//        area(posX: 1, posY: 6.1)
    }
}
