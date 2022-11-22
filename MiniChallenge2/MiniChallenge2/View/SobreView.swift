//
//  SobreView.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 18/11/22.
//

import SwiftUI

struct SobreView: View {
    var body: some View {
        VStack {
            ScrollView {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 120, height: 5, alignment: .center)
                    .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                    .opacity(0.7)
                    .padding(.bottom, 20)
                
                Text("Sobre")
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    .padding(.bottom, 10)
                
                Text("FANTASMINHA é um comfort games para todas as idades.")
                    .font(.system(size: 15, design: .rounded))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    .frame(alignment: .center)
                    .padding(.bottom, 10)
            }
            .padding()
        }
    }
}

