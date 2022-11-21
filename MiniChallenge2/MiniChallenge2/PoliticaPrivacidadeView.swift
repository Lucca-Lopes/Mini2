//
//  PoliticaPrivacidadeView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 18/11/22.
//

import SwiftUI

struct PoliticaPrivacidadeView: View {
    var body: some View {
        VStack {
            ScrollView {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 120, height: 5, alignment: .center)
                    .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                    .opacity(0.7)
                    .padding(.bottom, 20)
                
                Text("Política de Privacidade")
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    .padding(.bottom, 10)
                
                Text("""
                1. Não serão coletados dados sensíveis de nossos usuários.
                
                2. Não compartilhamos dados pessoais com terceiros. Apesar disso, é possível que o façamos para cumprir alguma determinação legal ou regulatória, ou, ainda, para cumprir alguma ordem expedida por autoridade pública.
                
                3. Quaisquer tipos de dados que por ventura precisem ser coletados, só serão coletados desde que sejam fornecidos com o consentimento do usuário. Conforme Lei de Proteção de Dados Pessoais, a coleta de dados e as atividades de tratamento dela decorrentes serão informadas aos usuários do aplicativo.
                """)
                    .font(.system(size: 15, design: .rounded))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    .frame(alignment: .center)
                    .padding(.bottom, 10)
            }
            .padding()
        }
    }
}
