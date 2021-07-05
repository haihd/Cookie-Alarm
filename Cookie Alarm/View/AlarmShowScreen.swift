//
//  AlarmShowScreen.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/04.
//

import SwiftUI
import AVFoundation

struct AlarmShowScreen: View {
    @Binding var alarm: Alarm
    var today: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, MMMM dd"
        return dateFormatterPrint.string(from: Date())
    }
    
    @State var queuePlayer: AVQueuePlayer?
    @State var playerLayer: AVPlayerLayer?
    @State var playbackLooper: AVPlayerLooper?
    
    func playSound() {
        self.queuePlayer?.play()
    }
    
    func pause() {
        self.queuePlayer?.pause()
    }
    
    func stop() {
        self.queuePlayer?.pause()
        self.queuePlayer?.seek(to: CMTime.init(seconds: 0, preferredTimescale: 1))
    }
    
    mutating func unload(){
        self.playerLayer = nil
        self.queuePlayer = nil
        self.playbackLooper = nil
    }
    
    var body: some View {
        
        VStack {
            
            Text(alarm.formatedTime).font(.system(size: 80)).padding(.top)
            Text(today).font(.title)
            
            Spacer()
            
            Text(alarm.description).font(.largeTitle)
            
            if(alarm.snooze) {
                Button(action: {
                    playSound()
                    // Update the schedule based on time
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
                // Stop the sound
                // Dismiss the screen
                pause()
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
        .onAppear() {
            let path = Bundle.main.path(forResource: "meo", ofType: "mp3")
            let playItem = AVPlayerItem(url: URL(fileURLWithPath: path!))
            self.queuePlayer = AVQueuePlayer(playerItem: playItem)
            self.playerLayer = AVPlayerLayer(player: self.queuePlayer)
            guard let queuePlayer = self.queuePlayer else {
                return
            }
            self.playbackLooper = AVPlayerLooper.init(player: queuePlayer, templateItem: playItem)

        }
    }
}

struct AlarmShowScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlarmShowScreen(alarm: .constant(Alarm.data[1]))
    }
}
