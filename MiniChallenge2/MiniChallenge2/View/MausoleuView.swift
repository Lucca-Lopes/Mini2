//
//  Mausoleu.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 21/11/22.
//

import SpriteKit

public class MausoleuView: SKNode {
    
    
    
    
    public func area(posX: CGFloat, posY: CGFloat) -> SKSpriteNode{
        let box = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        
        let x = (screenWidth / 2) / 2
        let y = (screenHeight * posY)
        
        box.position = CGPoint(x: x*posX, y: y)
        
        return box
    }
    
    public func cova(pos: CGPoint, sep: CGFloat, nome: String) -> SKScene{
        
        let cova = SKScene(size: CGSize(width: 48, height: 115))
            
            
        let box = SKSpriteNode(color: .lightGray, size: CGSize(width: 48, height: 115))
        
        let x = pos.x
        let y = pos.y
        
        box.position = CGPoint(x: x+sep, y: y)
        
        let fantasma = fantasminha(pos: box.position, nome: nome)
        
        cova.addChild(box)
        cova.addChild(fantasma)
        
        return cova
    }
    
    public func fantasminha(pos: CGPoint, nome: String) -> SKSpriteNode{
        let fanta = SKSpriteNode(imageNamed: nome)
        fanta.size = CGSize(width: fanta.size.width * 0.08, height: fanta.size.height * 0.08)
        fanta.alpha = 0.7
        fanta.position = pos
        return fanta
    }
}
