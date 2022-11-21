//
//  GameScene.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 18/11/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene{
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        hud()

        let posCova = CGFloat((131/4)-2)

        let areaPobre = area(posX: 1, posY: 0.7)
        let covaPobreEsq = cova(pos: areaPobre, sep: -posCova, nome: "pobre")
        let covaPobreDir = cova(pos: areaPobre, sep: posCova, nome: "pobre")


        let areaTrabalhador = area(posX: 3, posY: 0.7)
        let covaTrabEsq = cova(pos: areaTrabalhador, sep: -posCova, nome: "pobre")
        let covaTrabDir = cova(pos: areaTrabalhador, sep: posCova, nome: "pobre")


        let areaArtista = area(posX: 1, posY: 0.45)
        let covaArteEsq = cova(pos: areaArtista, sep: -posCova, nome: "pobre")
        let covaArteDir = cova(pos: areaArtista, sep: posCova, nome: "pobre")


        let areaEmpresario = area(posX: 3, posY: 0.45)
        let covaEmpresaEsq = cova(pos: areaEmpresario, sep: -posCova, nome: "pobre")
        let covaEmpresaDir = cova(pos: areaEmpresario, sep: posCova, nome: "pobre")


        let areaMilitar = area(posX: 1, posY: 0.2)
        let covaMilitarEsq = cova(pos: areaMilitar, sep: -posCova, nome: "pobre")
        let covaMilitarDir = cova(pos: areaMilitar, sep: posCova, nome: "pobre")


        let areaRealeza = area(posX: 3, posY: 0.2)
        let covaRealEsq = cova(pos: areaRealeza, sep: -posCova, nome: "pobre")
        let covaRealDir = cova(pos: areaRealeza, sep: posCova, nome: "pobre")
    }
    
    //posX: 1=esquerda, 3=direita
    func area(posX: CGFloat, posY: CGFloat) -> CGPoint{
        let box = SKSpriteNode(color: .gray, size: CGSize(width: 131, height: 142))
        
        let x = (self.size.width/2)/2
        let y = (self.size.height*posY)
        
        box.position = CGPoint(x: x*posX, y: y)
        
        addChild(box)
        
        return box.position
    }
    
    func cova(pos: CGPoint, sep: CGFloat, nome: String) -> CGPoint{
        let box = SKSpriteNode(color: .lightGray, size: CGSize(width: 48, height: 115))
        
        let x = pos.x
        let y = pos.y
        
        box.position = CGPoint(x: x+sep, y: y)
        
        addChild(box)
        fantasminha(pos: CGPoint(x: box.position.x, y: box.position.y), nome: nome)
        
        return box.position
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
        
        let moedaLabel = SKLabelNode(text: "099")
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
