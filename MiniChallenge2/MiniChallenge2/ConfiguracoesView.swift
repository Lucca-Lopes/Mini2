//
//  ConfiguracoesView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 18/11/22.
//

import Foundation
import SwiftUI

struct ConfiguracoesView: View {
    @State var musica = true
    @State var efeitosSonoros = true
    @State var showModal1 = false
    @State var showModal2 = false
    @State var showModal3 = false
    
    var body: some View{
        VStack{
            Spacer()
                .frame(height: 20)
            
            // inserir Música
            HStack{
                Button(action: {
                    musica = false
                },label: {
                    Image(systemName: "speaker.square")
                    Text("Música")
                        .font(.system(size: 17, design: .rounded))
                        .foregroundColor(.black)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                })
            }
            
            // inserir Efeitos Sonoros
            HStack{
                Button(action: {
                    efeitosSonoros = false
                },label: {
                    Image(systemName: "speaker.circle")
                    Text("Efeitos Sonoros")
                        .font(.system(size: 17, design: .rounded))
                        .foregroundColor(.black)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                })
            }
            
            Spacer()
                .frame(height: 30)
            
            //Aba: Sobre
            createButton(action2: {
                showModal1 = true
            }, label2: "Sobre")
//preciso escutar a mudança desse State para conseguir mostrar uma tela na frente
//$showModal1 é um binding do tipo booleano
            .sheet(isPresented: $showModal1){
                SobreView()
            }
            
            //Aba: Política de Privacidade
            createButton(action2: {
                showModal2 = true
            }, label2: "Política de Privacidade")
            .sheet(isPresented: $showModal2){
                PoliticaPrivacidadeView()
            }
            
            //Aba: Termos de Uso
            createButton(action2: {
                showModal3 = true
            }, label2: "Termos de Uso")
            .sheet(isPresented: $showModal3){
                TermosUsoView()
            }
            
            Spacer()
                .navigationTitle("Info")
                .navigationBarTitleDisplayMode(.inline)
        }
        .padding(20)
    }
    
    func createButton(action2: @escaping () -> Void, label2: String) -> some View {
        return
            Button(action: action2,
                   label: {
                Text(label2)
                    .font(.system(size: 17, design: .rounded))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
            })
            .foregroundColor(.white)
            .background(Color(red: 0.851, green: 0.851, blue: 0.851))
            .buttonStyle(.bordered)
            .cornerRadius(10)
            .buttonBorderShape(.automatic)
            .controlSize(.large)
    }
}
