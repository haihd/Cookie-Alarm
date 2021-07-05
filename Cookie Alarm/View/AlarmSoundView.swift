//
//  AlarmSoundView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/01.
//

import SwiftUI

struct SoundRow: View {
    @Binding var alarm: Alarm
    var sound: AlarmSound
    var isSelected: Bool {
        alarm.sound.id == sound.id
    }
    
    var body: some View {
        HStack {
            Text(sound.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !isSelected {
                alarm.sound = sound
            }
        }
    }
}

struct AlarmSoundView: View {
    @Binding var alarm: Alarm
    @State var selectedSound = Set<Int>()
    let sounds: [AlarmSound] = AlarmSound.sounds
    
    var body: some View {
        VStack {
            List(sounds, selection: $selectedSound){ sound in
                SoundRow(alarm: $alarm, sound: sound)
            }
        }
    }
}

struct AlarmSoundView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSoundView(alarm: .constant(Alarm.data[0]))
    }
}
