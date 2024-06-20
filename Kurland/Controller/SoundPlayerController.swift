//
//  SoundPlayerController.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import Foundation
import AVFoundation

class SoundPlayer: ObservableObject {
    static var shared = SoundPlayer()

    var effectsPlayer: AVAudioPlayer?
    var backgroundPlayer: AVAudioPlayer?
    var currentSoundName: String?

    func playEffects(soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "mp3") {
            do {
                if soundName != currentSoundName {
                    effectsPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    effectsPlayer?.setVolume(0.8, fadeDuration: 0)
                    effectsPlayer?.play()
                    currentSoundName = soundName
                } else {
                    effectsPlayer?.play()
                }
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }

    func playBackground(soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "mp3") {
            do {
                if soundName != currentSoundName {
                    backgroundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    backgroundPlayer?.numberOfLoops = -1
                    backgroundPlayer?.setVolume(0.5, fadeDuration: 0)
                    backgroundPlayer?.play()
                    currentSoundName = soundName
                } else {
                    backgroundPlayer?.play()
                }
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    func stopEffects() {
        effectsPlayer?.stop()
    }
    
    func stopBackground() {
        backgroundPlayer?.stop()
    }
}
