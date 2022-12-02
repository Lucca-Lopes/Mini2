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
    var textoMoedas: SKLabelNode
    
    public init(mausoleu: MausoleuView? = nil, cova: CovaView? = nil, vm: GameViewModel, textoMoedas: SKLabelNode) {
        self.vm = vm
        self.textoMoedas = textoMoedas
        fundo = SKSpriteNode(color: .black, size: CGSize(width: 300, height: 150))
        label = SKLabelNode(text: "Gostaria de comprar ")
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.fontSize = 24
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = fundo.size.width - 10
        
        
        label.fontName = "Impact"
        
        if let mausoleu = mausoleu {
            label.text? += "este mausoleu por \(mausoleu.preco) moedas?"
            self.mausoleu = mausoleu
        }
        
        if let cova = cova {
            label.text? += "esta cova por \(cova.preco) moedas?"
            self.cova = cova
        }
        
        fundo.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        label.position = CGPoint(x: fundo.position.x, y: fundo.position.y * 1.09)
        
        super.init()
        let botaoSim = BotaoNode(image: SKSpriteNode(color: .green, size: CGSize(width: 100, height: 50)), label: SKLabelNode(text: "Sim")) { botao in
            self.comprar()
            self.removeAllChildren()
            self.removeAllActions()
        }
        
        let botaoNao = BotaoNode(image: SKSpriteNode(color: .red, size: CGSize(width: 100, height: 50)), label: SKLabelNode(text: "Não")) { botao in
            self.removeAllChildren()
            self.removeAllActions()
        }
        
        botaoSim.label?.fontName = "Impact"
        botaoSim.label?.fontColor = .black
        botaoNao.label?.fontName = "Impact"
        botaoNao.label?.fontColor = .black
        
        botaoSim.position = CGPoint(x: fundo.position.x - botaoSim.image!.size.width * 0.6, y: fundo.position.y * 0.92)
        botaoNao.position = CGPoint(x: fundo.position.x + botaoNao.image!.size.width * 0.6, y: fundo.position.y * 0.92)
        
        self.addChild(fundo)
        self.addChild(label)
        self.addChild(botaoSim)
        self.addChild(botaoNao)
    }
    
    private func comprar(){
        if self.mausoleu != nil {
            if vm.moedas >= self.mausoleu!.preco {
                vm.moedas -= self.mausoleu!.preco
                self.mausoleu!.ativarMausoleu()
            }
        }
        
        if self.cova != nil {
            if vm.moedas >= self.cova!.preco {
                vm.moedas -= self.cova!.preco
//                guard let covaTocada = self.parent?.nodes(at: cova!.position) as? CovaView else { return }
//                self.parent?.nodes(at: cova?.position)
                self.cova!.ativarCova()
            }
        }
        self.textoMoedas.text = "\(vm.moedas)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
