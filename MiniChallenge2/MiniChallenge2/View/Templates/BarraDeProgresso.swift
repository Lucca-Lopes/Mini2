//
//  BarraDeProgresso.swift
//  MiniChallenge2
//
//  Created by Rodrigo Pereira on 24/11/22.
//

import SpriteKit

class BarraDeProgresso: SKNode{
    
    var borda: SKSpriteNode
    var bordaInterna: SKSpriteNode
    var barra: SKSpriteNode
    
    override init() {
        self.borda = SKSpriteNode(color: .black, size: .init(width: 30, height: 10))
        self.bordaInterna = SKSpriteNode(color: .gray, size: .init(width: 27, height: 7))
        self.barra = SKSpriteNode(color: .green, size: .init(width: 0, height: 7))
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func timer(tempo: CGFloat){
        let barraPorcentagem = self.bordaInterna.size.width / tempo
        
        let diminuiContagem = SKAction.repeat(.sequence([
            .run {
                self.barra.size.width += barraPorcentagem
            },
            .wait(forDuration: 1)
        ]), count: Int(tempo))
        
        barra.run(.sequence([
            .wait(forDuration: 1),
            diminuiContagem
        ]))
    }
    
    private func setup(){
        addChild(borda)
        addChild(bordaInterna)
        addChild(barra)
        barra.zPosition += 5
        barra.anchorPoint = .init(x: 0, y: 0.5)
//        barra.position.x = -(barra.size.width/2)
        barra.position.x = bordaInterna.position.x - bordaInterna.size.width/2
    }
}
