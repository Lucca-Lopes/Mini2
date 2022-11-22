//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene{
    
//    private var moedaBarra: BarraDeProgresso?
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        hud()

        let posCova = CGFloat((131/4)-2)

        let areaPobre = area(posX: 1, posY: 0.7)
        cova(pos: areaPobre, sep: -posCova, nome: "pobre")
        cova(pos: areaPobre, sep: posCova, nome: "pobre")


        let areaTrabalhador = area(posX: 3, posY: 0.7)
        cova(pos: areaTrabalhador, sep: -posCova, nome: "trabalhador")
        cova(pos: areaTrabalhador, sep: posCova, nome: "trabalhador")


        let areaArtista = area(posX: 1, posY: 0.45)
        cova(pos: areaArtista, sep: -posCova, nome: "artista")
        cova(pos: areaArtista, sep: posCova, nome: "artista")


        let areaEmpresario = area(posX: 3, posY: 0.45)
        cova(pos: areaEmpresario, sep: -posCova, nome: "empresario")
        cova(pos: areaEmpresario, sep: posCova, nome: "empresario")


        let areaMilitar = area(posX: 1, posY: 0.2)
        cova(pos: areaMilitar, sep: -posCova, nome: "militar")
        cova(pos: areaMilitar, sep: posCova, nome: "militar")


        let areaRealeza = area(posX: 3, posY: 0.2)
        cova(pos: areaRealeza, sep: -posCova, nome: "rei")
        cova(pos: areaRealeza, sep: posCova, nome: "rei")
        
//        moedaBarra = BarraDeProgresso()
//        addChild(moedaBarra!)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        moedaBarra?.progresso(0.01)
//    }
    
    
    //posX: 1=esquerda, 3=direita
    func area(posX: CGFloat, posY: CGFloat) -> CGPoint{
        let box = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        
        let x = (self.size.width/2)/2
        let y = (self.size.height*posY)
        
        box.position = CGPoint(x: x*posX, y: y)
        
        addChild(box)
        
        return box.position
    }
    
    func cova(pos: CGPoint, sep: CGFloat, nome: String){
        let box = SKSpriteNode(color: .lightGray, size: CGSize(width: 48, height: 115))
        
        let x = pos.x
        let y = pos.y
        
        box.position = CGPoint(x: x+sep, y: y)
        
        addChild(box)
        fantasminha(pos: CGPoint(x: box.position.x, y: box.position.y), nome: nome)
    }
    
    func fantasminha(pos: CGPoint, nome: String){
        let fanta = SKSpriteNode(imageNamed: nome)
        fanta.size = CGSize(width: fanta.size.width * 0.08, height: fanta.size.height * 0.08)
        fanta.alpha = 0.7
        fanta.position = pos
        addChild(fanta)
    }
    
    func hud() {
        let infoButton = SKButtonNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "info.circle")!))){
            print("Clicou")
        }
        
        infoButton.image?.size = CGSize(width: 35, height: 35)
        infoButton.position = CGPoint(x: self.size.width-55, y: self.size.height-100)
        
        let moedaImg = SKShapeNode(circleOfRadius: 17.5)
        moedaImg.fillColor = .yellow
        moedaImg.position = CGPoint(x: 55, y: self.size.height-100)
        
        let moedaLabel = SKLabelNode(text: "999")
        moedaLabel.fontColor = .black
        moedaLabel.verticalAlignmentMode = .center
        moedaLabel.horizontalAlignmentMode = .left
        moedaLabel.fontSize = 35
        moedaLabel.position = CGPoint(x: moedaImg.position.x+30, y: moedaImg.position.y)
        
        addChild(moedaImg)
        addChild(moedaLabel)
        addChild(infoButton)
    }
}
