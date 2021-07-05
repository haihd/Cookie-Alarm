//
//  AlarmRepeatView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/01.
//

import SwiftUI

struct DayRow: View {
    @Binding var alarm: Alarm
    var day: AlarmDay
    var isSelected: Bool {
        alarm.days.contains(day)
    }
    
    var body: some View {
        HStack {
            Text(day.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !isSelected {
                alarm.days.insert(day)
            } else {
                alarm.days.remove(day)
            }
        }
    }
}

struct AlarmRepeatView: View {
    @Binding var alarm: Alarm
    @State var allDays: [AlarmDay] = AlarmDay.days
    
    var body: some View {
        
        VStack {
            List(allDays, selection: $alarm.days){ day in
                DayRow(alarm: $alarm, day: day)
            }
        }
    }
}

struct AlarmRepeatView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRepeatView(alarm: .constant(Alarm.data[0]))
    }
}
