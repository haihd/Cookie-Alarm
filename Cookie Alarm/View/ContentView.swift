//
//  ContentView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct ContentView: View {
    @State var alarms : [Alarm] = Alarm.data
    var body: some View {
        TabView {
            AlarmListView(alarms: $alarms)
                .tabItem {
                    //Image(systemName: "alarm")
                    Label("Alarm", systemImage: "alarm")
                }
            MusicListView(songs: .constant(SleepMusic.allSongs))
                .tabItem {
                    //Image(systemName: "moon.zzz")
                    Label("Music", systemImage: "moon.zzz")
                }
            SettingView()
                .tabItem {
                    //Image(systemName: "gearshape")
                    Label("Setting", systemImage: "gearshape")
                }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
