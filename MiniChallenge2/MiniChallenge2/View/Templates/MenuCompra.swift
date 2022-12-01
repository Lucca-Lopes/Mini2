//
//  MenuCompra.swift
//  MiniChallenge2
//
//  Created by Rodrigo Ferreira Pereira on 01/12/22.
//

import SpriteKit

class MenuCompra: SKNode {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let fundo: SKSpriteNode
    let label: SKLabelNode
    var mausoleu: MausoleuView?
    var cova: CovaView?
    var vm: GameViewModel
    
    public init(mausoleu: MausoleuView? = nil, cova: CovaView? = nil, vm: GameViewModel) {
        self.vm = vm
        fundo = SKSpriteNode(color: .black, size: CGSize(width: 300, height: 250))
        label = SKLabelNode(text: "Gostaria de comprar ")
        
        if let mausoleu = mausoleu {
            label.text? += "este mausoleu por \(mausoleu.preco)?"
            self.mausoleu = mausoleu
        }
        
        if let cova = cova {
            label.text? += "esta cova por \(cova.preco)?"
            self.cova = cova
        }
        
        fundo.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        label.position = CGPoint(x: fundo.position.x, y: fundo.position.y * 1.15)
        
        super.init()
        let botaoSim = BotaoNode(image: SKSpriteNode(color: .green, size: CGSize(width: 100, height: 50)), label: SKLabelNode(text: "Sim")) { botao in
            self.comprar()
        }
        
        let botaoNao = BotaoNode(image: SKSpriteNode(color: .red, size: CGSize(width: 100, height: 50)), label: SKLabelNode(text: "Não")) { botao in
            self.removeAllChildren()
            self.removeAllActions()
        }
        
        botaoNao.position = CGPoint(x: fundo.position.x + botaoNao.image!.size.width * 0.6, y: fundo.position.y * 0.85)
        botaoSim.position = CGPoint(x: fundo.position.x - botaoSim.image!.size.width * 0.6, y: fundo.position.y * 0.85)
        
        self.addChild(fundo)
        self.addChild(label)
        self.addChild(botaoSim)
        self.addChild(botaoNao)
    }
    
    private func comprar(){
        if self.mausoleu != nil {
            if vm.moedas >= mausoleu!.preco {
                vm.moedas -= mausoleu!.preco
                mausoleu!.ativo = true
            }
        }
        
        if self.cova != nil {
            if vm.moedas >= cova!.preco {
                vm.moedas -= cova!.preco
                cova!.ativo = true
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
