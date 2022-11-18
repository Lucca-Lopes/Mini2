//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SpriteKit

class GameScene: SKScene{
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        
        let posCova = CGFloat((131/4)-2)
        
        let a1 = area(posX: 1, posY: 0.75)
        let c1 = cova(pos: a1, sep: -posCova)
        let c2 = cova(pos: a1, sep: posCova)
        fantasminha(pos: c1, nome: "PobreG.svg")
        fantasminha(pos: c2, nome: "EmpresarioG.svg")
        
        
        
        area(posX: 1, posY: 0.5)
        area(posX: 1, posY: 0.25)
        
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
    func area(posX: CGFloat, posY: CGFloat) -> CGPoint{
        let box = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        
        let x = (self.size.width/2)/2
        let y = (self.size.height*posY)
        
        box.position = CGPoint(x: x*posX, y: y)
        
        addChild(box)
        
        return box.position
    }
    
    func cova(pos: CGPoint, sep: CGFloat) -> CGPoint{
        let box = SKSpriteNode(color: .lightGray, size: CGSize(width: 48, height: 115))
        
        let x = pos.x
        let y = pos.y
        
        box.position = CGPoint(x: x+sep, y: y)
        
        addChild(box)
        
        return box.position
    }
    
    func fantasminha(pos: CGPoint, nome: String){
        let fanta = SKSpriteNode(imageNamed: nome)
        fanta.size = CGSize(width: fanta.size.width * 0.08, height: fanta.size.height * 0.08)
        fanta.alpha = 0.7
        fanta.position = pos
        addChild(fanta)
    }
}
