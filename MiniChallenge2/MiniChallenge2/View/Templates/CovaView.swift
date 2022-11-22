//
//  CovaView.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 22/11/22.
//

import SpriteKit

public class CovaView: SKNode {
    let posMausoleu: CGPoint
    let separador: CGFloat
    let nome: String
    let cova: SKSpriteNode
    let fantasma: SKSpriteNode
    
    public init(posMausoleu: CGPoint, separador: CGFloat, nome: String){
        self.posMausoleu = posMausoleu
        self.separador = separador
        self.nome = nome
        self.cova = SKSpriteNode(color: .lightGray, size: CGSize(width: 48, height: 115))
        
        self.cova.position = CGPoint(x: posMausoleu.x + separador, y: posMausoleu.y)
        
        self.fantasma = SKSpriteNode(imageNamed: nome)
        self.fantasma.size = CGSize(width: self.fantasma.size.width * 0.08, height: self.fantasma.size.height * 0.08)
        self.fantasma.alpha = 0.7
        self.fantasma.position = self.cova.position
        
        super.init()
        
        self.addChild(self.cova)
        self.addChild(self.fantasma)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
