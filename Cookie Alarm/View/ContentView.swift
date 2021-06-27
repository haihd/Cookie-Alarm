//
//  ContentView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AlarmListView(alarms: .constant(Alarm.data))
                .tabItem {
                    Image(systemName: "alarm")
                }
            MusicListView()
                .tabItem {
                    Image(systemName: "moon.zzz")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape")
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
