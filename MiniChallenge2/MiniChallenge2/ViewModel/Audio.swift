//
//  Audio.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 30/11/22.
//

import AVKit

struct Audio {
    
    private static let keyMusicaAtivada : String = "musicaAtivada"
    
    private static let keyEfeitosAtivados : String = "efeitosAtivados"
    
    static let musicaFundo : URL = Bundle.main.url(
        forResource: "gameThemeTheFoyer",
        withExtension: "wav"
    )!
    
    static let efeitoMoeda : URL = Bundle.main.url(
        forResource: "gameThemeTheFoyer",
        withExtension: "wav"
    )!
    
    static func inicializarValoresPadrao() -> Void {
        UserDefaults.standard.register(defaults: [
            keyMusicaAtivada : true,
            keyEfeitosAtivados: true,
        ])
    }
    
    static func pegarMusicaAtivada() -> Bool {
        UserDefaults.standard.bool(forKey: keyMusicaAtivada)
    }
    
    static func salvarMusicaAtivada(valor: Bool) -> Void {
        UserDefaults.standard.set(valor, forKey: keyMusicaAtivada)
    }
    
    static func pegarEfeitosAtivados() -> Bool {
        UserDefaults.standard.bool(forKey: keyEfeitosAtivados)
    }
    
    static func salvarEfeitosAtivados(valor: Bool) -> Void {
        UserDefaults.standard.set(valor, forKey: keyEfeitosAtivados)
    }
}
