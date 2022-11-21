//
//  ContentView.swift
//  MiniChallenge2
//
//  Created by Lucca Lopes on 16/11/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var showConfig = false
    
    var scene: SKScene{
        //crio a variavel que cria uma cena através do inicializador GameScene()
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        return scene //retorno a cena
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink(destination: {
                        ConfiguracoesView()
                    }, label: {
                            Image(systemName: "info.circle")
                        })
                    .navigationBarHidden(true)
                    .navigationBarTitle("Voltar")
                    }
                }
            }
        }
//        SpriteView(scene: scene)
//            .ignoresSafeArea()
    }

