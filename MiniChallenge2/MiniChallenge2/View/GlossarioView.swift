//
//  GlossarioView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 06/01/23.
//

import SpriteKit
import SwiftUI

class GlossarioView: SKScene {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var background = SKSpriteNode(imageNamed: "backgroundFantasmapedia")
    var posicao = 0
    var imagemCentral: SKSpriteNode = SKSpriteNode()
    var tipo: SKLabelNode = SKLabelNode()
    var descricao: SKLabelNode = SKLabelNode()
    
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
     
        let botaoVoltar = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            self.view?.presentScene(SceneController.gameScene!, transition: .fade(withDuration: 0.5))
        }
        botaoVoltar.addChild(SKSpriteNode(color: .clear, size: CGSize(width: 50, height: 50)))
        botaoVoltar.image?.size = CGSize(width: 12, height: 18)
        botaoVoltar.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight-100)
        botaoVoltar.zPosition = 1
        
        
        //botão esquerda
        let botaoEsquerda = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.backward")!)), label: .init(text: "")){ botao in
            self.posicao -= 1
                if(self.posicao < 0){
                    self.posicao = self.fantasmas.count - 1
                }
            self.atualizarTela(fantasma: self.fantasmas[self.posicao])
        }
        botaoEsquerda.addChild(SKSpriteNode(color: .clear, size: CGSize(width: 50, height: 50)))
        botaoEsquerda.image?.size = CGSize(width: 12, height: 18)
        botaoEsquerda.position = CGPoint(x: (screenWidth/2)-155, y: screenHeight/2)
        botaoEsquerda.zPosition = 1
        addChild(botaoEsquerda)
        
        
        //botão direita
        let botaoDireita = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "chevron.right")!)), label: .init(text: "")){ botao in
            self.posicao += 1
            if(self.posicao == self.fantasmas.count){
                    self.posicao = 0
                }
            self.atualizarTela(fantasma: self.fantasmas[self.posicao])
        }
        botaoDireita.addChild(SKSpriteNode(color: .clear, size: CGSize(width: 50, height: 50)))
        botaoDireita.image?.size = CGSize(width: 12, height: 18)
        botaoDireita.position = CGPoint(x: (screenWidth/2)+155, y: screenHeight/2)
        botaoDireita.zPosition = 1
        addChild(botaoDireita)
        
        
        self.atualizarTela(fantasma: fantasmas[posicao])
       
        
        background.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(background)
        addChild(botaoVoltar)
    }
    
    
    func atualizarTela(fantasma : Fantasma) -> Void {
        self.imagemCentral.removeFromParent()
        self.tipo.removeFromParent()
        self.descricao.removeFromParent()
        //imagem central
        let imagemCentral = SKSpriteNode(imageNamed: fantasma.imagem)
        imagemCentral.position = CGPoint(x: self.screenWidth/2, y: self.screenHeight/2)
        imagemCentral.size = CGSize(width: 150, height: 150)
        imagemCentral.zPosition = 1
        self.imagemCentral = imagemCentral
        addChild(imagemCentral)
        //texto central - tipo
        let tipo = SKLabelNode(fontNamed: "Arial")
        tipo.text = fantasmas[posicao].tipo
        tipo.fontSize = 20
        tipo.fontColor = .black
        tipo.horizontalAlignmentMode = .center
        tipo.verticalAlignmentMode = .center
        tipo.position = CGPoint(x: (screenWidth * 0.5), y: (screenHeight * 0.5)-110)
        tipo.zPosition = 1
        tipo.lineBreakMode = NSLineBreakMode.byWordWrapping
        tipo.numberOfLines = 0
        tipo.preferredMaxLayoutWidth = screenWidth-20
        self.tipo = tipo
        addChild(tipo)
        //texto central - descricao
        let descricao = SKLabelNode(fontNamed: "Arial")
        descricao.text = fantasmas[posicao].descricao
        descricao.fontSize = 15
        descricao.fontColor = .black
        descricao.horizontalAlignmentMode = .center
        descricao.verticalAlignmentMode = .top
        descricao.position = CGPoint(x: (screenWidth * 0.5), y: (screenHeight * 0.5)-145)
        descricao.zPosition = 1
        descricao.lineBreakMode = NSLineBreakMode.byWordWrapping
        descricao.numberOfLines = 0
        descricao.preferredMaxLayoutWidth = screenWidth-20
        self.descricao = descricao
        addChild(descricao)
    }
    
    
    struct Fantasma: Identifiable {
        let id = UUID().uuidString
        let imagem: String
        let tipo: String
        let descricao: String
    }

    let fantasmas: [Fantasma] = [
        Fantasma(imagem: "pobre",
                 tipo: "Pobre",
                 descricao: "Morreu de pobreza."),
        Fantasma(imagem: "artista",
                 tipo: "Artista",
                 descricao: "Acredita que em sua morte finalmente terá fama."),
        Fantasma(imagem: "militar",
                 tipo: "Militar",
                 descricao: "Sempre exercendo seu dever para com a sociedade mesmo depois de morto. Mantém o cemitério sempre em ordem."),
        Fantasma(imagem: "empresario",
                 tipo: "Empresário",
                 descricao: "Deu o sangue pela empresa. Literalmente."),
        Fantasma(imagem: "trabalhador",
                 tipo: "Trabalhador",
                 descricao: "Morreu de tanto trabalhar."),
        Fantasma(imagem: "rei",
                 tipo: "Rei",
                 descricao: "Eternamente vivendo no luxo.")
    ]
    
}


