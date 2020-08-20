//
//  audioPlayer.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/03.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        
        catch{
            print("Could not find audio file")
        }
    }
}
