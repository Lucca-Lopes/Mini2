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
    
    public init(posMausoleu: CGPoint, nome: String, ativo: Bool, cova1Ativa: Bool, cova2Ativa: Bool, dinheiroGanho: Int) {
        let separador = CGFloat((131/4)-2)
        let AreaMausoleu = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        let x = (screenWidth / 2) / 2
        let y = (screenHeight * posMausoleu.y)
        AreaMausoleu.position = CGPoint(x: x * posMausoleu.x, y: y)
        
        super.init()
        
        self.addChild(AreaMausoleu)
        AreaMausoleu.addChild(CovaView(posMausoleu: CGPoint.zero, separador: separador, nome: nome, ativo: cova1Ativa, dinheiroGanho: dinheiroGanho))
        AreaMausoleu.addChild(CovaView(posMausoleu: CGPoint.zero, separador: -separador, nome: nome, ativo: cova2Ativa, dinheiroGanho: dinheiroGanho))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//CoreData que deu errado
//if let covas = entidade.covas?.allObjects as? [Cova] {
//    print(covas)
//    for cova in covas {
//        print("chegou aqui")
//        addChild(CovaView(posMausoleu: CGPoint.zero, separador: -separador, nome: nome, entidade: cova))
//
//    }
//}
