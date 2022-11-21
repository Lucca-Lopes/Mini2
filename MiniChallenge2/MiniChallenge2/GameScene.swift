//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 16/11/22.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene{
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .black
    }
    
    //essa fç é um reset da cena e coloca todos os elementos de volta redimensionados. É chamada num redimensionamento de cena (diferentes cel)
    func setup(){
        removeAllChildren()
//        let radius: CGFloat = 50
////        let node = SKShapeNode(circleOfRadius: radius) //crio uma forma
//        let node = SKShapeNode(circleOfRadius: radius)
//        node.fillColor = .green
//
//        let x = self.size.width - radius //x com tamanho da cena
//        let y = self.size.height/2  //y na metade da altura (centralizado)
        
        let img = SKSpriteNode(imageNamed: "prancheta1.svg")
        img.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.5)
        img.size = CGSize(width: img.size.width * 0.05, height: img.size.height * 0.05)
//        let img2 = SKSpriteNode(imageNamed: "prancheta1.svg")
//        img2.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.5)
//        img2.size = CGSize(width: img2.size.width * 0.045, height: img2.size.height * 0.06)
        self.addChild(img)
//        self.addChild(img2)
        
//        node.position = CGPoint(x: x, y: y) //posição do nó é igual ao CGPoint nessas coordenadas
        
//        addChild(node)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        setup()
    }
}
