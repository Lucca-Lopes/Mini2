//
//  BarraDeProgresso.swift
//  MiniChallenge2
//
//  Created by Rodrigo Pereira on 22/11/22.
//

import Foundation
import SpriteKit

class BarraDeProgresso: SKNode{
    var barra: SKSpriteNode
    var borda: SKSpriteNode
    
    override init() {
        self.barra = SKSpriteNode(color: .green, size: CGSize(width: 30, height: 10))
        self.borda = SKSpriteNode(color: .black, size: CGSize(width: 30, height: 10))
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.barra = SKSpriteNode(color: .green, size: CGSize(width: 30, height: 10))
        self.borda = SKSpriteNode(color: .black, size: CGSize(width: 30, height: 10))
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        addChild(borda)
        addChild(barra)
        
        barra.zPosition += 5
        
        barra.anchorPoint = .init(x: 0, y: 0.5)
        borda.anchorPoint = .init(x: 0, y: 0.5)
//        barra.position.x = -(barra.size.width/2)
        borda.position = CGPoint(x: 100, y: 500)
        barra.position = CGPoint(x: 100, y: 500)
    }
    
    public func progresso(_ valor: CGFloat){
        let valorCorreto = min(max(0, valor), 1)
        
        barra.run(.scaleX(to: valorCorreto, duration: 0.1))
    }
}
