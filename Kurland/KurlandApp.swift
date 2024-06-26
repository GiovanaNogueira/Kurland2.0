//
//  KurlandApp.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import SwiftUI
import AVFoundation

@main
struct KurlandApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var soundPlayer = SoundPlayer.shared
    @State var cenaAtual = dao.cenaAtual
    @State var wasUsedCabelo1: Bool = false
    @State var wasUsedCabelo2: Bool = false
    @State var lastIsNatu: Bool = false
    @State var count = 0
    @State var hasFinished: Bool = false
    init() {
        let cfURL = Bundle.main.url(forResource: "PatrickHand-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                switch dao.cenaAtual {
                case .abertura:
                    ContentView(cenaAtual: $cenaAtual)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSonora")
                        }
                case .introducao:
                    Tela2(cenaAtual: $cenaAtual)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSonora")
                        }
                case .ayanaTriste:
                    AyanaTriste(cenaAtual: $cenaAtual)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "musicaTriste")
                            
                        }
                case .espelho:
                    Espelho(cenaAtual: $cenaAtual)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
//                            var timer: Timer?
//                                        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false) { _ in
//                                            // Ajusta a currentTime após 60 segundos
//                                            soundPlayer.backgroundPlayer?.currentTime = 60
//                                            timer?.invalidate()
//                                            timer = nil
//                                        }
                        }
                case .abreCastelo:
                    FriendsView(cenaAtual: $cenaAtual,
                          wasUsedCabelo1: $wasUsedCabelo1,
                          wasUsedCabelo2: $wasUsedCabelo2)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .primEscolha:
                    EscolhasView(cenaAtual: $cenaAtual,
                          wasUsedCabelo1: $wasUsedCabelo1,
                          wasUsedCabelo2: $wasUsedCabelo2, lastIsNatu: $lastIsNatu,
                          count: $count)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .jogoNatureza:
                    JogoNatureza(count: $count, wasUsedCabelo1: $wasUsedCabelo1, cenaAtual: $cenaAtual)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "trilhaJogos")
                        }
                case .pedraNoCaminho:
                    RioCastelo(cenaAtual: $cenaAtual,
                               wasUsedCabelo1: $wasUsedCabelo1,
                               wasUsedCabelo2: $wasUsedCabelo2, lastIsNatu: $lastIsNatu, count: $count)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .rioCastelo:
                    RioCastelo(cenaAtual: $cenaAtual,
                               wasUsedCabelo1: $wasUsedCabelo1,
                               wasUsedCabelo2: $wasUsedCabelo2, lastIsNatu: $lastIsNatu, count: $count)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .jogoPedra:
                    JogoPedra(cenaAtual: $cenaAtual, wasUsedCabelo1: $wasUsedCabelo1, wasUsedCabelo2: $wasUsedCabelo2)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .convFinal1:
                    ConversaFinal1(cenaAtual: $cenaAtual, lastIsNatu: $lastIsNatu)
//                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .convFinal2:
                    ConversaFinal2(cenaAtual: $cenaAtual, lastIsNatu: $lastIsNatu)
//                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.playBackground(soundName: "trilhaSemInicio")
                        }
                case .princesas:
                    Princesas(cenaAtual: $cenaAtual, lastIsNatu: $lastIsNatu,
                              hasFinished: $hasFinished)
//                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "trilhaFinal")
                        }
                case .theEnd:
                    TheEnd(
                        cenaAtual: $cenaAtual,
                        count: $count,
                        wasUsedCabelo1: $wasUsedCabelo1,
                        wasUsedCabelo2: $wasUsedCabelo2,
                        hasFinished: $hasFinished)
                        .transition(.opacity)
                        .onAppear {
                            soundPlayer.stopBackground()
                            soundPlayer.playBackground(soundName: "trilhaFinal")
                        }
                case .diaryEntry:
                    DiaryEntry()
                        .transition(.opacity)
                case .diarySwipe:
                    DiarySwipe()
                        .transition(.opacity)
                case .diaryDisplay:
                    DiaryDisplay()
                        .transition(.opacity)
                case .stellaDiary:
                    StellaDiary()
                        .transition(.opacity)
                case .genarateAI:
                    GenerateAI()
                        .transition(.opacity)
                case .aiInfo:
                    AiInfo()
                        .transition(.opacity)
                }
            }
            .onChange(of: cenaAtual) { newCena in
                // Salva a cena atual para retomar a música
                UserDefaults.standard.set(newCena.rawValue, forKey: "cenaAtual")
                // Muda a música com base na cena atual (se necessário)
                switch newCena {
                case .ayanaTriste:
                    soundPlayer.playBackground(soundName: "musicaTriste")
                default:
                    soundPlayer.stopBackground()
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .active {
                    print("active")
                    soundPlayer.backgroundPlayer?.play()
                }
                if phase == .background {
                    print("back")
                    do {
                        try DAO.instance.save()
                    } catch {
                        print("Não salvou!", error)
                    }
//                    cenaAtual = .abertura
                }
                if phase == .inactive {
                    print("inactive")
//                    dao.cenaAtual = .abertura
                }
            }
            .animation(.default, value: cenaAtual)
        }
    }
}
