//: [Previous](@previous)

import Foundation

// IS type casting
class MediaItem {
    var name: String
    init(name:String) {
        self.name = name
    }
}
class Song:MediaItem{
    var artist: String
    init(name:String,artist:String) {
        self.artist = artist
        super.init(name:name)
    }
}
class Movie:MediaItem{
    var director:String
    init(name:String,director:String){
        self.director = director
        super.init(name:name)
    }
}

let library = [
Movie(name: "Revolver", director: "Guy Richi"),
Movie(name: "Fight Club", director: "Chak Palanik"),
Song(name: "Many men", artist: "50 cent"),
Song(name: "Moonlight Sonata", artist: "Bethoven")
]

var movieCount = 0
var songCount = 0

for item in library{
    if item is Movie{
        movieCount += 1
    } else if item is Song{
        songCount += 1
    }
}
print("Media libarary constrains \(movieCount), movies and \(songCount) songs")

// AS down casting
for item in library{
    if let movie = item as? Movie{
        print("Movie \(movie.name), dir is \(movie.director)")
    } else if let song = item as? Song{
        print("Song \(song.name), artist \(song.artist)")
    }
}


