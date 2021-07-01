//
//  AlarmDetailView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct AlarmDetailView: View {
    @Binding var alarm: Alarm
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    @State var tmpAlarm: Alarm = Alarm()
    
    @State var showDayPicker: Bool = false
    @State var showSoundPicker: Bool = false
    @State var showLabelEditor: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                HStack {
                    Text("Time")
                    Spacer()
                    DatePicker(selection: $alarm.time, in: ...Date(),
                    displayedComponents: .hourAndMinute) {
                        Text("")
                    }
                }
                
                HStack {
                    Text("Repeat")
                    Spacer()
                    Text(alarm.repeatDays).foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    tmpAlarm.days = alarm.days
                    showDayPicker = true
                }
                .sheet(isPresented: $showDayPicker) {
                    NavigationView {
                        AlarmRepeatView(alarm: $tmpAlarm)
                        .navigationTitle("Repeat on")
                        .navigationBarItems(leading: Button("Cancel"){
                            showDayPicker = false
                        },
                        trailing: Button("Done") {
                            showDayPicker = false
                            alarm.days = tmpAlarm.days
                        })
                    }
                }
                
                // Update label
                HStack {
                    Text("Label")
                    Spacer()
                    Text(alarm.description).foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    tmpAlarm.description = alarm.description
                    showLabelEditor = true
                }
                .sheet(isPresented: $showLabelEditor) {
                    NavigationView {
                        List {
                            TextField("Label", text: $tmpAlarm.description)
                        }
                        .navigationTitle("Alarm label")
                        .navigationBarItems(leading: Button("Cancel"){
                            showLabelEditor = false
                        },
                        trailing: Button("Done") {
                            showLabelEditor = false
                            alarm.description = tmpAlarm.description
                        })
                    }
                }
                
                // Select sound
                HStack {
                    Text("Sound")
                    Spacer()
                    Text(alarm.sound.name).foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    tmpAlarm.sound = alarm.sound
                    showSoundPicker = true
                }
                .sheet(isPresented: $showSoundPicker) {
                    
                    NavigationView {
                        AlarmSoundView(alarm: $tmpAlarm)
                        .navigationTitle("Select sound")
                        .navigationBarItems(leading: Button("Cancel"){
                            showSoundPicker = false
                        },
                        trailing: Button("Done") {
                            showSoundPicker = false
                            alarm.sound = tmpAlarm.sound
                        })
                    }
                }
                
                // Snooze
                HStack {
                    Text("Snooze")
                    Spacer()
                    Toggle(isOn: $alarm.snooze, label: {
                        Text("")
                    })
                }
                
                // Delete alarm
                HStack {
                    Spacer()
                    Text("Delete Alarm").foregroundColor(.red)
                    Spacer()
                }
            }
            
        }
        
    }
}

struct AlarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetailView(alarm: .constant(Alarm.data[0]))
    }
}
