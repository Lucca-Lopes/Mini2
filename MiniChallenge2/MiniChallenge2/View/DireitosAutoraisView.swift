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
    var background = SKSpriteNode(imageNamed: "backgroundDireitos")
    
    class func direitosScene() -> DireitosAutoraisView {
        guard let scene = SKScene(fileNamed: "Direitos Autorais") as? DireitosAutoraisView else {
            abort()
        }
        scene.scaleMode = .resizeFill
        return scene
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene)
        }
        
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        addChild(botaoVoltar)
        
        let texto = SKLabelNode(fontNamed: "Inter")
        texto.text = "©2022RIP. Todos os direitos reservados a seus criadores: Larissa Teixeira, Caroline Stelitano, Lucca Lopes e Rodrigo Pereira. Direitos relacionados a música The Foyer, de PlayOnLoop.com, são licenciados por Creative Commons by Attribution 4.0."
        
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
