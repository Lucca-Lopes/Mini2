//
//  SobreView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 24/11/22.
//

import SpriteKit

class SobreView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    
    class func sobreScene() -> SobreView {
        guard let scene = SKScene(fileNamed: "Sobre") as? SobreView else {
            abort()
        }
        scene.scaleMode = .resizeFill
        return scene
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .gray
        
        let texto = SKLabelNode(fontNamed: "Chalkduster")
        texto.text = """
        Fantasminha é um jogo estilo comfort
        games.
        
        """
        texto.fontSize = 15
        texto.horizontalAlignmentMode = .left
        texto.verticalAlignmentMode = .top
        texto.position = CGPoint(x: 20, y: 700)
        texto.numberOfLines = 10
        addChild(texto)
    }
}
