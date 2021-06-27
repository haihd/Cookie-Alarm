//
//  AlarmDetailView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct AlarmDetailView: View {
    @Binding var alarm: Alarm
    var body: some View {
        Text("Alarm: \(alarm.type)")
    }
}

struct AlarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetailView(alarm: .constant(Alarm.data[0]))
    }
}
