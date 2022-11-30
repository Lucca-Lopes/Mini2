//
//  SobreView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 24/11/22.
//

import SpriteKit

class SobreView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
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
        
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene)
        }
        
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        addChild(botaoVoltar)
        
        let texto = SKLabelNode(fontNamed: "Chalkduster")
//        let texto = self.childNode(withName: "label") as? SKLabelNode
        texto.text = "Fantasminha é um jogo estilo comfort games para todas as idades."
        
        texto.fontSize = 15
        texto.horizontalAlignmentMode = .left
        texto.verticalAlignmentMode = .top
        texto.position = CGPoint(x: 20, y: 700)
        texto.lineBreakMode = NSLineBreakMode.byWordWrapping
        texto.numberOfLines = 0
        texto.preferredMaxLayoutWidth = screenWidth
        
        addChild(texto)
    }
}
