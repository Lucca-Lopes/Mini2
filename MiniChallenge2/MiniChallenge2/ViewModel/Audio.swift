//
//  Audio.swift
//  MiniChallenge2
//
//  Created by Caroline Stelitano on 30/11/22.
//

import AVFoundation
import AVKit

struct Audio {
    let musicaFundo : URL
    let efeitoMoeda : URL
    
    struct Musica {
        let url = Bundle.main.url(forResource: "gameThemeTheFoyer", withExtension: "wav")
//        let musicaFundo = AVAudioPlayer(contentsOf: URL)
    }
    
    struct Efeito {
        let efeitoMoeda = Bundle.main.url(forResource: "gameThemeTheFoyer", withExtension: "wav")
    }
}



