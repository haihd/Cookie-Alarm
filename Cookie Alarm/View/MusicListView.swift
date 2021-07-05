//
//  MusicListView.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/06/27.
//

import SwiftUI

struct MusicListView: View {
    @Binding var songs: [SleepMusic]
    @State var selectedSong: Set<UUID> = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(songs, selection: $selectedSong) { song in
                HStack {
//                    Image(systemName: "music.note.list").resizable().frame(width: 40, height: 40, alignment: .center)
                    //                        .border(Color.gray)
//                    song.thumbnail.resizable().frame(width: 40, height: 40, alignment: .center)
//                        .border(Color.gray)
//                    Text(song.name)
                    Label(song.name, systemImage: "music.note.list")
                    Spacer()
                    if(selectedSong.contains(song.id)) {
                        Image(systemName: "pause.circle").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    } else {
                        Image(systemName: "play.circle")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedSong.removeAll()
                    selectedSong.insert(song.id)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Music List")
        }
        
    }
    
}

struct MusicListView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView(songs: .constant(SleepMusic.allSongs))
    }
}
