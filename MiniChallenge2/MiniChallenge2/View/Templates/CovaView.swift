//
//  CovaView.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 22/11/22.
//

import SpriteKit

public class CovaView: SKNode {
    let posMausoleu: CGPoint
    let separador: CGFloat
    let nome: String
    let cova: SKSpriteNode
    let fantasma: SKSpriteNode
    let dinheiroGanho: Int
    var barraDeProgresso: BarraDeProgresso
    var ativo: Bool
    var preco: Int

    public init(posMausoleu: CGPoint, separador: CGFloat, nome: String, ativo: Bool, dinheiroGanho: Int, tempo: CGFloat, preco: Int){
        self.posMausoleu = posMausoleu
        self.separador = separador
        self.nome = nome
        self.dinheiroGanho = dinheiroGanho
        self.barraDeProgresso = BarraDeProgresso(tempo: tempo)
        self.ativo = ativo
        self.preco = preco
        self.cova = SKSpriteNode(imageNamed: (ativo ? "Terrinha" : "Cova"))
        
        self.cova.position = CGPoint(x: posMausoleu.x + separador, y: posMausoleu.y)
        self.cova.size = CGSize(width: self.cova.size.width * 0.25, height: self.cova.size.height * 0.25)
        
        self.fantasma = SKSpriteNode(imageNamed: nome)
        self.fantasma.size = CGSize(width: self.fantasma.size.width * 0.08, height: self.fantasma.size.height * 0.08)
        self.fantasma.alpha = 0.7
        self.fantasma.position = self.cova.position
        
        self.barraDeProgresso.position = CGPoint(x: self.fantasma.position.x, y: self.fantasma.position.y + self.fantasma.size.height * 0.6)
        self.barraDeProgresso.timer()
        
        super.init()
        
        self.addChild(self.cova)
        self.addChild(self.fantasma)
        self.addChild(self.barraDeProgresso)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func ativarCova(){
        
    }
    
}
