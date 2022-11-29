//
//  DireitosAutoraisView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 25/11/22.
//

import SwiftUI
import SpriteKit

class DireitosAutoraisView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    
    class func direitosScene() -> DireitosAutoraisView {
        guard let scene = SKScene(fileNamed: "Direitos Autorais") as? DireitosAutoraisView else {
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
        @2022FANTASMINHA
        
        """
        texto.fontSize = 15
        texto.horizontalAlignmentMode = .left
        texto.verticalAlignmentMode = .top
        texto.position = CGPoint(x: 20, y: 700)
        texto.numberOfLines = 10
        addChild(texto)
    }
}
