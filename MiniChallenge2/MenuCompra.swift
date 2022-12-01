//
//  MenuCompra.swift
//  MiniChallenge2
//
//  Created by Rodrigo Ferreira Pereira on 01/12/22.
//

import SpriteKit

class MenuCompra: SKNode {
    let fundo: SKSpriteNode
    let label: SKLabelNode
    var mausoleu: MausoleuView?
    var cova: CovaView?
    
    public init(mausoleu: MausoleuView? = nil, cova: CovaView? = nil) {
        fundo = SKSpriteNode(color: .black, size: CGSize(width: 100, height: 100))
        label = SKLabelNode(text: "Gostaria de comprar ")
        
        if let mausoleu = mausoleu {
            label.text? += "este mausoleu por \(mausoleu.preco)?"
            self.mausoleu = mausoleu
        }
        
        if let cova = cova {
            label.text? += "esta cova por \(cova.preco)?"
            self.cova = cova
        }
        
        
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
