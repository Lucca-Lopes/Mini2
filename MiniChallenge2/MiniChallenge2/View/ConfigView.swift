//
//  ConfigView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 24/11/22.
//

import SpriteKit
import AVFAudio

class ConfigView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let vm = GameViewModel()
    var background = SKSpriteNode(imageNamed: "backgroundConfig")
    var audioAtivado = true
    
    
    class func configScene() -> ConfigView {
        guard let scene = SKScene(fileNamed: "Configuracao") as? ConfigView else {
            abort()
        }
        scene.scaleMode = .resizeFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        
        let botaoMusica = BotaoNode(
            image: SKSpriteNode(
                texture: SKTexture(
                    image: UIImage(imageLiteralResourceName: self.audioAtivado ? "botaoMusicaTicado" : "botaoMusica")
                )
            ),
            label: .init(text: " ")
        ){ botao in
            self.trocarAudio()
            botao.removeAllChildren()
            botao.image = SKSpriteNode(
                texture: SKTexture(
                    image: UIImage(imageLiteralResourceName: self.audioAtivado ? "botaoMusicaTicado" : "botaoMusica")
                )
            )
            botao.addChild(botao.image!)
        }
        
        let botaoEfeitos = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(imageLiteralResourceName: "botaoEfeitosTicado"))), label: .init(text: " ")){ botao in
        }
        
        let botaoSobre = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(imageLiteralResourceName: "botaoSobre"))), label: .init(text: " ")){ botao in
            let scene: SKScene = SobreView(size: self.size)
            self.view?.presentScene(scene, transition: .fade(withDuration: 0.5))
        }
        
        let botaoPrivacidade = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(imageLiteralResourceName: "botaoPolitica"))), label: .init(text: " ")){ botao in
            let scene: SKScene = PoliticaPrivacidadeView(size: self.size)
            self.view?.presentScene(scene, transition: .fade(withDuration: 0.5))
        }
        
        let botaoDireitos = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(imageLiteralResourceName: "botaoDireitos"))), label: .init(text: " ")){ botao in
            let scene: SKScene = DireitosAutoraisView(size: self.size)
            self.view?.presentScene(scene, transition: .fade(withDuration: 0.5))
        }
        
        botaoMusica.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
        botaoMusica.zPosition = 1
        botaoEfeitos.position = CGPoint(x: screenWidth/2, y: botaoMusica.position.y - 75)
        botaoEfeitos.zPosition = 1
        botaoSobre.position = CGPoint(x: screenWidth/2, y: botaoEfeitos.position.y - 75)
        botaoSobre.zPosition = 1
        botaoPrivacidade.position = CGPoint(x: screenWidth/2, y: botaoSobre.position.y - 75)
        botaoPrivacidade.zPosition = 1
        botaoDireitos.position = CGPoint(x: screenWidth/2, y: botaoPrivacidade.position.y - 45)
        botaoDireitos.zPosition = 1
        
        background.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        
        self.addChild(botaoMusica)
        self.addChild(botaoEfeitos)
        self.addChild(botaoSobre)
        self.addChild(botaoPrivacidade)
        self.addChild(botaoDireitos)
        addChild(background)
    }
    
    
    func trocarAudio(){
        audioAtivado = !audioAtivado
    }
}
