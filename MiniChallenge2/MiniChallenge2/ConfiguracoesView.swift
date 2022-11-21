//
//  ConfiguracoesView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 18/11/22.
//

import Foundation
import SwiftUI

struct ConfiguracoesView: View {
    var musica = true
    var efeitosSonoros = true
    @State var showModal1 = false
    @State var showModal2 = false
    @State var showModal3 = false
    
    var body: some View{
        VStack{
            // inserir Música
            // inserir Efeitos Sonoros
            
            //Aba: Sobre
            HStack{
                Button(action: {
                    showModal1 = true
                }, label: {
                    Text("Sobre")
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
//preciso escutar a mudança desse State para conseguir mostrar uma tela na frente
//$showModal1 é um binding
            .sheet(isPresented: $showModal1){
                SobreView()
            }
        }
        
        //Aba: Política de Privacidade
        HStack{
            Button(action: {
                showModal2 = true
                
            }, label: {
                Text("Política de Privacidade")
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
        .sheet(isPresented: $showModal2){
            PoliticaPrivacidadeView()
        }
        
        //Aba: Termos de Uso
        HStack{
            Button(action: {
                showModal3 = true
                
            }, label: {
                Text("Termos de Uso")
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
        .sheet(isPresented: $showModal3){
            TermosUsoView()
        }
        Spacer()
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
    }
}
