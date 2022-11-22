//
//  Mausoleu.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 21/11/22.
//

import SpriteKit

public class MausoleuView: SKNode {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    public init(posMausoleu: CGPoint, nome: String) {
        
        let separador = CGFloat((131/4)-2)
        
        let AreaMausoleu = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        let x = (screenWidth / 2) / 2
        let y = (screenHeight * posMausoleu.y)
        AreaMausoleu.position = CGPoint(x: x * posMausoleu.x, y: y)
        
        print("Posicao mausoleu: \(posMausoleu)")
        
        let cova1 = CovaView(posMausoleu: CGPoint.zero, separador: -separador, nome: nome)
        let cova2 = CovaView(posMausoleu: CGPoint.zero, separador: separador, nome: nome)
        
        super.init()
        
        self.addChild(AreaMausoleu)
        AreaMausoleu.addChild(cova1)
        AreaMausoleu.addChild(cova2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
