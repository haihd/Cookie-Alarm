//
//  Model.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/01.
//

import Foundation

//enum AlarmDay: String, CaseIterable, Identifiable {
//    var id: String { UUID().uuidString }
//
//    case Monday = "Monday"
//    case Tuesday = "Tuesday"
//    case Wednesday = "Wednesday"
//    case Thursday = "Thursday"
//    case Friday = "Friday"
//    case Saturday = "Saturday"
//    case Sunday = "Sunday"
//}

struct AlarmDay: Identifiable, Hashable {
    var id: Int
    var name: String

    init() {
        self.id = 0
        self.name = ""
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension AlarmDay {
    static var days: [AlarmDay] = [
        AlarmDay(id: 0, name: "Monday"),
        AlarmDay(id: 1, name: "Tuesday"),
        AlarmDay(id: 2, name: "Wednesday"),
        AlarmDay(id: 3, name: "Thursday"),
        AlarmDay(id: 4, name: "Friday"),
        AlarmDay(id: 5, name: "Saturday"),
        AlarmDay(id: 6, name: "Sunday"),
    ]
    
    func getDayIdxByName(name: String) -> Int {
        switch name {
        case "Monday":
            return 1
        case "Tuesday":
            return 2
        case "Wednesday":
            return 3
        case "Thursday":
            return 4
        case "Friday":
            return 5
        case "Saturday":
            return 6
        case "Sunday":
            return 7
        default:
            return 0
        }
    }
    
    static func getDayByName(name: String) -> AlarmDay {
        for day in days {
            if day.name == name {
                return day
            }
        }
        
        return AlarmDay()
    }
}
