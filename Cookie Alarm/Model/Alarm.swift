//
//  Alarm.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import Foundation

struct Alarm: Identifiable {
    var id : Int
    var type: Int
    var time: Date
    var status: Bool
    var description: String
    var snooze: Bool
    var sound: AlarmSound
    var days: Set<AlarmDay>
    
    var formatedTime : String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "hh:mm"
        return dateFormatterPrint.string(from: self.time)
    }
    
    var repeatDays: String {
        get {
            if(days.count == AlarmDay.days.count) {
                return "Everyday"
            } else if(days.contains(AlarmDay.getDayByName(name: "Saturday")) && days.contains(AlarmDay.getDayByName(name: "Sunday"))) {
                return "Weekend"
            } else if(days.count == 5 && !days.contains(AlarmDay.getDayByName(name: "Saturday")) && !days.contains(AlarmDay.getDayByName(name: "Sunday"))) {
                return "Weekday"
            } else {
                return days.sorted(by: { $0.id < $1.id }).map{ $0.name.prefix(3) }.joined(separator: " ")
            }
        }
    }
    
    init() {
        self.id = 0
        self.type = 0
        self.time = Date()
        self.status = false
        self.description = ""
        self.snooze = false
        self.sound = AlarmSound.sounds[0]
        self.days = Set<AlarmDay>()
    }
    
    init(id: Int, type: Int, time: Date, status: Bool, description: String, snooze: Bool, sound: AlarmSound) {
        self.id = id
        self.type = type
        self.time = time
        self.status = status
        self.description = description
        self.snooze = snooze
        self.sound = sound
        self.days = Set<AlarmDay>()
    }
    
    func copy() -> Alarm {
        var copy = Alarm()
        copy.type = self.type
        copy.time = self.time
        copy.status = self.status
        copy.description = self.description
        copy.snooze = self.snooze
        copy.sound = self.sound
        copy.days = self.days
        return copy
    }
    
    
}

extension Alarm {
    static var data: [Alarm] = initAlarmData()
}

func initAlarmData() -> [Alarm] {
    var alarms: [Alarm] = []
    alarms.append(Alarm(id: 1, type: 1, time: Date(), status: true, description: "Alarm 1", snooze: false, sound: AlarmSound.sounds[0]))
    alarms.append(Alarm(id: 2, type: 2, time: Date(), status: true, description: "Alarm 2", snooze: true, sound: AlarmSound.sounds[2]))
    alarms.append(Alarm(id: 3, type: 2, time: Date(), status: false, description: "Alarm 3", snooze: false, sound: AlarmSound.sounds[1]))
    alarms.append(Alarm(id: 4, type: 1, time: Date(), status: true, description: "Alarm 4", snooze: false, sound: AlarmSound.sounds[0]))
    
    return alarms
}
