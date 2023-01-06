//
//  ContentView.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 16/11/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
//        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
//            VStack {
//                Button{
//                    print("Clicou")
//                    let configScene: SKScene = ConfigView(size: self.scene.size)
//                    self.scene.view?.presentScene(configScene)
//                }label:{
//                    Text("Config")
//                }
//                Spacer()
//            }
            
//        }
        
    }
}
