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
    let screenHeight = UIScreen.main.bounds.size.height
    
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
        
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene)
        }
        
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        addChild(botaoVoltar)
        
        let texto = SKLabelNode(fontNamed: "Chalkduster")
        texto.text = "@2022FANTASMINHA. Todos os direitos reservados a seus criadores: Larissa Teixeira, Caroline Stelitano, Lucca Lopes e Rodrigo Pereira. Direitos relacionados a música The Foyer, de PlayOnLoop.com, são licensiados por Creative Commons by Attribution 4.0."
        
        texto.fontSize = 15
        texto.horizontalAlignmentMode = .left
        texto.verticalAlignmentMode = .top
        texto.position = CGPoint(x: 20, y: 700)
        texto.lineBreakMode = NSLineBreakMode.byWordWrapping
        texto.numberOfLines = 0
        texto.preferredMaxLayoutWidth = screenWidth-20
        
        addChild(texto)
    }
}
