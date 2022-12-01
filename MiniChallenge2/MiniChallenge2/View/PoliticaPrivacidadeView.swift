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
    
    class func politicaScene() -> PoliticaPrivacidadeView {
        guard let scene = SKScene(fileNamed: "Politica de Privacidade") as? PoliticaPrivacidadeView else {
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
        texto.text = "Não serão coletados dados sensíveis de nossos usuários. Não compartilhamos dados pessoais com terceiros. Apesar disso, é possível que o façamos para cumprir alguma determinação legal ou regulatória, ou ainda, para cumprir alguma ordem expedida por autoridade pública. Quaisquer tipos de dados que por ventura precisem ser coletados só serão coletados desde que sejam fornecidos com o consentimento do usuário. Conforme Lei de Proteção de Dados Pessoais, a coleta de dados e as atividades de tratamento delas decorrentes serão informadas aos usuários do aplicativo."

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
