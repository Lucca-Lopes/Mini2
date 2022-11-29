 //
//  BotaoNode.swift
//  MiniChallenge2
//
//  Created by Rodrigo Pereira on 23/11/22.
//

import SpriteKit

class BotaoNode: SKNode{
    var image: SKSpriteNode?
    var label: SKLabelNode?
    var action: ((BotaoNode)->Void)?
    
    init(image: SKSpriteNode, label: SKLabelNode, action: @escaping (BotaoNode) -> Void) {
        self.image = image
        self.label = label
        self.action = action
        self.label?.horizontalAlignmentMode = .center
        self.label?.verticalAlignmentMode = .center
        super.init()
        self.isUserInteractionEnabled = true
        
        self.addChild(image)
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?(self)
    }
}
