//
//  AlarmView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct AlarmListView: View {
    @Binding var alarms: [Alarm]
    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    NavigationLink(
                        destination: AlarmDetailView(alarm: binding(for: alarm)),
                        label: {
                            Label("Alarm: \(alarm.id)", systemImage: "alarm")
                        })
                }
            }
        }
    }
    
    private func binding(for alarm: Alarm) -> Binding<Alarm> {
        guard let index = alarms.firstIndex(where: { $0.id == alarm.id }) else {
            fatalError("Cant find alarm")
        }

        return $alarms[index]
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView(alarms: .constant(Alarm.data))
    }
}
