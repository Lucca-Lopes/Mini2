//
//  HUD.swift
//  MiniChallenge2
//
//  Created by Rodrigo Pereira on 24/11/22.
//

import SpriteKit

public class HUDView: SKNode{
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    let infoButton = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(systemName: "info.circle")!))){
        print("Clicou")
    }
    
    public override init() {
        infoButton.image?.size = CGSize(width: 35, height: 35)
        infoButton.position = CGPoint(x: screenWidth-55, y: screenHeight-100)
        
        let moedaImg = SKShapeNode(circleOfRadius: 17.5)
        moedaImg.fillColor = .yellow
        moedaImg.position = CGPoint(x: 55, y: screenHeight-100)
        
        let moedaLabel = SKLabelNode(text: "999")
        moedaLabel.fontColor = .black
        moedaLabel.verticalAlignmentMode = .center
        moedaLabel.horizontalAlignmentMode = .left
        moedaLabel.fontSize = 35
        moedaLabel.position = CGPoint(x: moedaImg.position.x+30, y: moedaImg.position.y)
        
        super.init()
        
        self.addChild(moedaImg)
        self.addChild(moedaLabel)
        self.addChild(infoButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
