//
//  Music.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/17/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import Foundation

class Music {
    var persistentID : UInt64
    var albumTitle : String
    var albumArtist : String
    var genre : String
    var title : String
    var artist : String
    var artwork : URL
    var assetURL : URL
    
    init(persistentID : UInt64, title : String, artist : String, assetURL : URL, genre : String?) {
        self.persistentID = persistentID
        self.title = title
        self.artist = artist
        self.artwork = URL(fileURLWithPath: "")
        self.assetURL = assetURL
        self.genre = (genre == nil ? "" : genre!)
        self.albumTitle = ""
        self.albumArtist = ""
    }
    
    init(persistentID : UInt64, title : String, artist : String, assetURL : URL, genre : String, artwork : URL) {
        self.persistentID = persistentID
        self.title = title
        self.artist = artist
        self.artwork = artwork
        self.assetURL = assetURL
        self.genre = genre
        self.albumTitle = ""
        self.albumArtist = ""
    }
    
    init(persistentID : UInt64, title : String, artist : String, assetURL : URL, genre : String, artwork : URL, albumTitle : String, albumArtist : String) {
        self.persistentID = persistentID
        self.title = title
        self.artist = artist
        self.artwork = artwork
        self.assetURL = assetURL
        self.genre = genre
        self.albumTitle = albumTitle
        self.albumArtist = albumArtist
    }
}
