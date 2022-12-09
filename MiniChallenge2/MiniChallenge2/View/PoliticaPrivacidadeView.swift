//
//  PoliticaPrivacidadeView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 25/11/22.
//

import SwiftUI
import SpriteKit

class PoliticaPrivacidadeView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var background = SKSpriteNode(imageNamed: "backgroundPolitica")
    
    class func politicaScene() -> PoliticaPrivacidadeView {
        guard let scene = SKScene(fileNamed: "Politica de Privacidade") as? PoliticaPrivacidadeView else {
            abort()
        }
        scene.scaleMode = .resizeFill
        return scene
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene, transition: .fade(withDuration: 0.5))
        }
        
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        addChild(botaoVoltar)
        
        let texto = SKLabelNode(fontNamed: "Inter")
        texto.text = "Não serão coletados dados sensíveis de nossos usuários. Não compartilhamos dados pessoais com terceiros. Apesar disso, é possível que o façamos para cumprir alguma determinação legal ou regulatória, ou ainda, para cumprir alguma ordem expedida por autoridade pública. Quaisquer tipos de dados que por ventura precisem ser coletados só serão coletados desde que sejam fornecidos com o consentimento do usuário. Conforme Lei de Proteção de Dados Pessoais, a coleta de dados e as atividades de tratamento delas decorrentes serão informadas aos usuários do aplicativo."

        texto.fontSize = 15
        texto.fontColor = .black
        texto.horizontalAlignmentMode = .center
        texto.verticalAlignmentMode = .center
        texto.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.35)
        texto.lineBreakMode = NSLineBreakMode.byWordWrapping
        texto.numberOfLines = 0
        texto.preferredMaxLayoutWidth = screenWidth-20
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        background.zPosition = -10
        
        addChild(texto)
        addChild(background)
    }
}
