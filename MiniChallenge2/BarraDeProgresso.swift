//
//  BarraDeProgresso.swift
//  MiniChallenge2
//
//  Created by Rodrigo Pereira on 24/11/22.
//

import SpriteKit

class BarraDeProgresso: SKNode{
    
    var borda: SKSpriteNode
    var bordaInterna: SKSpriteNode
    var barra: SKSpriteNode
    
    override init() {
        self.borda = SKSpriteNode(color: .green, size: .init(width: 300, height: 100))
        self.bordaInterna = SKSpriteNode(color: .black, size: .init(width: 270, height: 70))
        self.barra = SKSpriteNode(color: .systemPink, size: .init(width: 270, height: 70))
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.borda = SKSpriteNode(color: .green, size: .init(width: 300, height: 100))
        self.bordaInterna = SKSpriteNode(color: .black, size: .init(width: 270, height: 70))
        self.barra = SKSpriteNode(color: .systemPink, size: .init(width: 270, height: 70))
        super.init(coder: aDecoder)
        setup()
    }
    
    public func timer(tempo: Int){
//        var tempoAtual = tempo+1
        let maxBarra = self.barra.size.width
        let barraPorcentagem: Double = Double(maxBarra) / Double(tempo)
        self.barra.size.width = maxBarra
        
        let diminuiContagem = SKAction.repeat(.sequence([
            .run {
//                tempoAtual -= 1
                self.barra.size.width -= CGFloat(barraPorcentagem)
            },
            .wait(forDuration: 1)
        ]), count: tempo)
        
        barra.run(.sequence([
            .wait(forDuration: 1),
            diminuiContagem
        ]))
        
//        barra.run(.wait(forDuration: 1))
//        barra.run(.repeat(.sequence([
//            .run {
////                tempoAtual -= 1
//                self.barra.size.width -= CGFloat(barraPorcentagem)
//            },
//            .wait(forDuration: 1)
//        ]), count: tempo))
        
//        if tempoAtual > 0{
//            barra.run(.repeatForever(.sequence([
//                .run {
//                    tempoAtual -= 1
//                    barraPorcentagem -= 0.1
//                    self.barra.size.width = maxBarra * CGFloat(barraPorcentagem)
//                },
//                .wait(forDuration: 1)
//            ])))
//        }else{
//            self.barra.size.width = 0
//        }
        
    }
    
    private func setup(){
        addChild(borda)
        addChild(bordaInterna)
        addChild(barra)
        barra.zPosition += 5
        barra.anchorPoint = .init(x: 0, y: 0.5)
        barra.position.x = -(barra.size.width/2)
    }
    
//    public func updateProgress(_ amount: CGFloat){
//        let correctAmount = min(max(0, amount), 1)
//        barra.run(.scaleX(to: correctAmount, duration: 0.3))
//        timer(tempo: 10)
//    }
}
