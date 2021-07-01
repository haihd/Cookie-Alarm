//
//  AlarmView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct AlarmListView: View {
    @Binding var alarms: [Alarm]
    @State var isPresented: Bool = false
    @State var newAlarm: Alarm = Alarm()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    NavigationLink(destination: AlarmDetailView(alarm: binding(for: alarm))) {
                        AlarmRow(alarm: binding(for: alarm))
                    }
                }
                .onDelete(perform: { indexSet in
                    alarms.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Alarm")
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
//              leading: Button("Edit"){},
                trailing: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Add")
                })
            )
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    AlarmDetailView(alarm: $newAlarm)
                    .navigationTitle("Add alarm")
                    .navigationBarItems(leading: Button("Cancel"){
                        isPresented = false
                    },
                    trailing: Button("Done") {
                        isPresented = false
                        // Store alarm
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
