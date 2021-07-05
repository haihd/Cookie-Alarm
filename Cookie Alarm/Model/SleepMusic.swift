//
//  SleepMusic.swift
//  Cookie Alarm
//
//  Created by Hai Ha on 2021/07/05.
//

import Foundation
import SwiftUI

struct SleepMusic: Identifiable, Hashable {
    var id : UUID
    var name: String
    var file: String
    var image: String

    var thumbnail: Image {
        Image(image)
    }
}

extension SleepMusic {
    static var allSongs: [SleepMusic] = initData()
}

func initData() -> [SleepMusic] {
    var songs: [SleepMusic] = []
    songs.append(SleepMusic(id: UUID(), name: "Song 1", file: "file_1", image: "song_1"))
    songs.append(SleepMusic(id: UUID(), name: "Song 2", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 3", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 4", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 5", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 6", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 7", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 8", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 9", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 10", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 11", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 12", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 13", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 14", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 15", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 16", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 17", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 18", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 19", file: "file_2", image: "song_2"))
    songs.append(SleepMusic(id: UUID(), name: "Song 20", file: "file_2", image: "song_2"))
    
    return songs
}
