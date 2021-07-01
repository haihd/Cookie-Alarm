//
//  AlarmRow.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/01.
//

import SwiftUI

struct AlarmRow: View {
    @Binding var alarm: Alarm
    
    var formatedTime : String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "hh:mm"
        return dateFormatterPrint.string(from: alarm.time)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(formatedTime).font(.largeTitle)
                    Text("AM").font(.title2)
                }
                Text(alarm.description)
            }
            .foregroundColor(alarm.status ? .black : .gray)
            
            Spacer()
            Toggle(isOn: $alarm.status, label: {
                Text("Status")
            })
            .labelsHidden()
        }
    }
}

struct AlarmRow_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRow(alarm: .constant(Alarm.data[0]))
    }
}
