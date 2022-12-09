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
    var background = SKSpriteNode(imageNamed: "backgroundSobre")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    
        
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene, transition: .fade(withDuration: 0.5))
        }
        botaoVoltar.addChild(SKSpriteNode(color: .clear, size: CGSize(width: 50, height: 50)))
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        addChild(botaoVoltar)
        
        let texto = SKLabelNode(fontNamed: "Inter")
        texto.text = "Aqui Jaz é um jogo estilo comfort games para todas as idades. Colete as moedas, desbloqueie novas áreas e seus fantasmas e se divirta nessa aventura fantasmagórica."
        
        texto.fontSize = 15
        texto.fontColor = .black
        texto.horizontalAlignmentMode = .center
        texto.verticalAlignmentMode = .center
        texto.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        texto.lineBreakMode = NSLineBreakMode.byWordWrapping
        texto.numberOfLines = 0
        texto.preferredMaxLayoutWidth = screenWidth-20
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        background.zPosition = -10
        
        addChild(background)
        addChild(texto)
    }
}
