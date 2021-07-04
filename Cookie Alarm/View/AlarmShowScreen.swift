//
//  AlarmShowScreen.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/04.
//

import SwiftUI


struct AlarmShowScreen: View {
    @Binding var alarm: Alarm
    
    var body: some View {
        VStack {
            Spacer()
      
            Text(alarm.description).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            if(alarm.snooze) {
                Button(action: {
                    
                }, label: {
                    Text("Snooze")
                })
                .frame(minWidth: 100)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .clipShape(Capsule())
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Stop")
            })
            .frame(minWidth: 100)
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .clipShape(Capsule())
        }
    }
}

struct AlarmShowScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlarmShowScreen(alarm: .constant(Alarm.data[1]))
    }
}
