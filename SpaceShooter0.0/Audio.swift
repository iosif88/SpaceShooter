//
//  Audio.swift
//  SpaceShooter0.0
//
//  Created by Iosif Dubikovski on 12/26/22.
//

import Foundation
import AVFoundation

  
    var backgroundMusic:AVAudioPlayer?
    let path = Bundle.main.path(forResource: "Background.mp3", ofType:nil)!
    let url = URL(fileURLWithPath: path)
    func playSound(){
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        
        } catch {
            print(" couldn't load file :(")
        }
    }

var music: AVAudioPlayer!

func playMusic() {
    if let musicURL = Bundle.main.url(forResource: "Background", withExtension: "mp3") {
        if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
            music = audioPlayer
            music.numberOfLoops = -1
            music.play()
        }
    }
}
