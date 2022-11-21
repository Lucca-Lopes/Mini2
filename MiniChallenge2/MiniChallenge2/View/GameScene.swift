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
        
        let posCova = CGFloat((131/4)-2)
        
        let a1 = vm.area(posX: 1, posY: 0.75)
        let c1 = vm.cova(pos: a1.position, sep: -posCova, nome: "PobreG")
        let c2 = vm.cova(pos: a1.position, sep: posCova, nome: "EmpresarioG")
//        vm.fantasminha(pos: c1.position, nome: "PobreG")
//        vm.fantasminha(pos: c2.position, nome: "EmpresarioG")
        
//        vm.area(posX: 1, posY: 0.5)
//        vm.area(posX: 1, posY: 0.25)
        
        addChild(a1)
        addChild(c1)
        addChild(c2)
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
    
    //posX: 1=esquerda, 3=direita
    
}
