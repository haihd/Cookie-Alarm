//
//  Sound.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/01.
//

import Foundation

struct AlarmSound: Identifiable, Hashable {
    var id: Int
    var name: String
    var file: String
    
    init() {
        self.id = 0
        self.name = "Default"
        self.file = "default"
    }
    
    init(id: Int, name: String, file: String) {
        self.id = id
        self.name = name
        self.file = file
    }
}

extension AlarmSound {
    static var sounds: [AlarmSound] = [
        AlarmSound(id: 0, name: "Default", file: "default"),
        AlarmSound(id: 1, name: "Cat sound 1", file: "meow_1"),
        AlarmSound(id: 2, name: "Cat sound 2", file: "meow_2"),
        AlarmSound(id: 3, name: "Cat sound 3", file: "meow_3")
    ]
    
    func getSoundById(id: Int) -> AlarmSound {
        for sound in AlarmSound.sounds {
            if sound.id == id {
                return sound
            }
        }
        
        return AlarmSound.sounds[0]
    }
}
