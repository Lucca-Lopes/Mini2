import SpriteKit
import AVFAudio

class GameScene: SKScene{
    
    let vm = GameViewModel()
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var musicPlayer: AVAudioPlayer?
    var coinPlayer: AVAudioPlayer?
    var textoMoedas: SKLabelNode = SKLabelNode()
    
    override func sceneDidLoad() {
        SceneController.gameScene = self
        Audio.inicializarValoresPadrao()
        self.decidirSeTocaMusica()
        backgroundColor = .systemGray6
        
        let infoButton = BotaoNode(image: SKSpriteNode(texture: SKTexture(image: UIImage(imageLiteralResourceName: "engrenagem"))), label: .init(text: "")){ botao in
            let scene: SKScene = ConfigView(size: self.size)
            self.view?.presentScene(scene)
        }
        
        infoButton.image?.size = CGSize(width: 35, height: 35)
        infoButton.position = CGPoint(x: screenWidth-55, y: screenHeight-100)
        
        textoMoedas = SKLabelNode(text: "\(vm.moedas)")
        textoMoedas.horizontalAlignmentMode = .left
        textoMoedas.verticalAlignmentMode = .center
        textoMoedas.fontSize = 42
        textoMoedas.position = CGPoint(x: screenWidth * 0.25, y: screenHeight * 0.875)
        
        
        let spriteMoeda = SKSpriteNode(imageNamed: "moeda")
        spriteMoeda.size = CGSize(width: spriteMoeda.size.width * 0.2, height: spriteMoeda.size.height * 0.2)
        spriteMoeda.position = CGPoint(x: textoMoedas.position.x - (spriteMoeda.size.width / 1.85), y: textoMoedas.position.y)
        
        //Em posMausoleu, para criar a área na direita, passa-se 1 como parâmetro do x. Para criar na esquerda, passa-se 3.
        let mausoleu1 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.7), nome: "pobre", ativo: vm.mausoleus[0], cova1Ativa: vm.covas[0], cova2Ativa: vm.covas[1], dinheiroGanho: 5, tempoCova: 5, precoMausoleu: 0, precoCova: 50)
        let mausoleu2 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.7), nome: "trabalhador", ativo: vm.mausoleus[3], cova1Ativa: vm.covas[6], cova2Ativa: vm.covas[7], dinheiroGanho: 15, tempoCova: 10, precoMausoleu: 100, precoCova: 50)

        let mausoleu3 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.45), nome: "artista", ativo: vm.mausoleus[1], cova1Ativa: vm.covas[2], cova2Ativa: vm.covas[3], dinheiroGanho: 30, tempoCova: 15, precoMausoleu: 100, precoCova: 50)
        let mausoleu4 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.45), nome: "empresario", ativo: vm.mausoleus[4], cova1Ativa: vm.covas[8], cova2Ativa: vm.covas[9], dinheiroGanho: 45, tempoCova: 20, precoMausoleu: 100, precoCova: 50)

        let mausoleu5 = MausoleuView(posMausoleu: CGPoint(x: 1, y: 0.2), nome: "militar", ativo: vm.mausoleus[2], cova1Ativa: vm.covas[4], cova2Ativa: vm.covas[5], dinheiroGanho: 60, tempoCova: 25, precoMausoleu: 100, precoCova: 50)
        let mausoleu6 = MausoleuView(posMausoleu: CGPoint(x: 3, y: 0.2), nome: "rei", ativo: vm.mausoleus[5], cova1Ativa: vm.covas[10], cova2Ativa: vm.covas[11], dinheiroGanho: 90, tempoCova: 30, precoMausoleu: 100, precoCova: 50)
        
        
        addChild(textoMoedas)
        addChild(spriteMoeda)
        addChild(mausoleu1)
        addChild(mausoleu2)
        addChild(mausoleu3)
        addChild(mausoleu4)
        addChild(mausoleu5)
        addChild(mausoleu6)
        addChild(infoButton)
    }
    
    func decidirSeTocaMusica() {
        let musicaAtivada = Audio.pegarMusicaAtivada()
        if (musicaAtivada) {
            playMusic()
        } else {
            stopMusic()
        }
    }
    
    func decidirSeTocaMoeda() {
        let efeitosAtivados = Audio.pegarEfeitosAtivados()
        if (efeitosAtivados) {
            playCoin()
        }
    }
    
    private func playMusic() {
        do {
            self.musicPlayer = try AVAudioPlayer(contentsOf: Audio.musicaFundo)
            self.musicPlayer?.numberOfLoops = -1
            self.musicPlayer?.play()
        } catch {
            print("Erro ao reproduzir som.")
        }
    }
    
    private func stopMusic() {
        self.musicPlayer?.stop()
    }
    
    private func playCoin() {
        do {
            if (self.coinPlayer == nil) {
                self.coinPlayer = try AVAudioPlayer(contentsOf: Audio.efeitoMoeda)
            }
            self.coinPlayer?.play()
        } catch {
            print("Erro ao reproduzir som.")
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        guard let covaTocada = touchedNodes.first(where: {$0 is CovaView}) as? CovaView else { return }
        
        if covaTocada.barraDeProgresso.barra.size.width >= covaTocada.barraDeProgresso.bordaInterna.size.width - 0.001 {
            decidirSeTocaMoeda()
            vm.moedas+=covaTocada.dinheiroGanho
            textoMoedas.text = "\(vm.moedas)"
            covaTocada.barraDeProgresso.timer()
            print("clicou em \(covaTocada.nome)")
        }
        
        if !covaTocada.ativo{
            
        }
    }
}
