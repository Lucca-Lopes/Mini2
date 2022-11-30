//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SpriteKit
import AVFAudio

class GameScene: SKScene{
    
    let vm = GameViewModel()
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    func configScene() -> ConfigView {
        guard let scene = SKScene(fileNamed: "Configuracao") as? ConfigView else {
            abort()
        }
        scene.scaleMode = .resizeFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        
        let infoButton = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "info.circle")!)), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene)
        }
        
        infoButton.image?.size = CGSize(width: 35, height: 35)
        infoButton.position = CGPoint(x: screenWidth-55, y: screenHeight-100)
        
        //Em posMausoleu, para criar a área na direita, passa-se 1 como parâmetro do x. Para criar na esquerda, passa-se 3.
        let mausoleu1 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.7), nome: "pobre")
        let mausoleu2 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.45), nome: "artista")
        let mausoleu3 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.2), nome: "militar")
        
        let mausoleu4 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.7), nome: "trabalhador")
        let mausoleu5 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.45), nome: "empresario")
        let mausoleu6 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.2), nome: "rei")
        
        addChild(HUDView())
        addChild(mausoleu1)
        addChild(mausoleu2)
        addChild(mausoleu3)
        addChild(mausoleu4)
        addChild(mausoleu5)
        addChild(mausoleu6)
        addChild(infoButton)
    }
}
