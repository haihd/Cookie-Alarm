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
    
    init(id: Int, type: Int, time: Date, status: Bool) {
        self.id = id
        self.type = type
        self.time = time
        self.status = status
    }
}

extension Alarm {
    static var data: [Alarm] = initAlarmData()
}

func initAlarmData() -> [Alarm] {
    var alarms: [Alarm] = []
    alarms.append(Alarm(id: 1, type: 1, time: Date(), status: true))
    alarms.append(Alarm(id: 2, type: 2, time: Date(), status: true))
    alarms.append(Alarm(id: 3, type: 2, time: Date(), status: false))
    alarms.append(Alarm(id: 4, type: 1, time: Date(), status: true))
    
    return alarms
}
