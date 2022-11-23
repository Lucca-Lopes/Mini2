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
        hud()
        
        //Em posMausoleu, para criar a área na direita, passa-se 1 como parâmetro do x. Para criar na esquerda, passa-se 3.
        let mausoleu1 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.7), nome: "pobre")
        let mausoleu2 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.45), nome: "artista")
        let mausoleu3 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.2), nome: "militar")
        
        let mausoleu4 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.7), nome: "trabalhador")
        let mausoleu5 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.45), nome: "empresario")
        let mausoleu6 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.2), nome: "rei")
        
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
    
    func hud() {
        let infoButton = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "info.circle")!))){
            print("Clicou")
        }
        
        infoButton.image?.size = CGSize(width: 35, height: 35)
        infoButton.position = CGPoint(x: self.size.width-55, y: self.size.height-100)
        
        let moedaImg = SKShapeNode(circleOfRadius: 17.5)
        moedaImg.fillColor = .yellow
        moedaImg.position = CGPoint(x: 55, y: self.size.height-100)
        
        let moedaLabel = SKLabelNode(text: "999")
        moedaLabel.fontColor = .black
        moedaLabel.verticalAlignmentMode = .center
        moedaLabel.horizontalAlignmentMode = .left
        moedaLabel.fontSize = 35
        moedaLabel.position = CGPoint(x: moedaImg.position.x+30, y: moedaImg.position.y)
        
        addChild(moedaImg)
        addChild(moedaLabel)
        addChild(infoButton)
    }
}
