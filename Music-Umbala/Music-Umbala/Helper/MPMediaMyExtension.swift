//
//  MPMediaExtension.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/5/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer

class MPMediaMyExtension {
    
    static func queryMedia(identifier : MPMediaEntityPersistentID) -> MPMediaItemCollection {
        
        let predicateId = MPMediaPropertyPredicate(value: NSNumber(value: identifier), forProperty: MPMediaItemPropertyPersistentID, comparisonType: MPMediaPredicateComparison.equalTo)
        
        let query = MPMediaQuery.init()
        query.addFilterPredicate(predicateId)
        
        let collection = MPMediaItemCollection(items: query.items!)
        
        return collection;
    }
    
    static func queryPlaylist(lstID : [UInt64]) -> [MPMediaItem] {
        var collection : [MPMediaItem] = []
        for id in lstID {
            collection += ( queryMedia(identifier: MPMediaEntityPersistentID(id)).items )
        }
        
        return collection
    }
    
    static func getMusicByMPMediaItem(mediaItems : [MPMediaItem]?) -> [Music] {
        var modelMusic : [Music] = []
        
        if let mediaItemsU = mediaItems {
            let mediaCollection = MPMediaItemCollection(items: mediaItemsU)
            
            let arrItem : [MPMediaItem] = mediaCollection.items
            for mediaItem in arrItem {
                let albumTitle = mediaItem.albumTitle
                let albumArtist = mediaItem.albumArtist
                let genre = mediaItem.genre
                let title = mediaItem.title
                let artist = mediaItem.artist
                let artwork = mediaItem.artwork
                let assetURL = mediaItem.assetURL
                //                print("\(String(describing: assetURL))")
                print("\(mediaItem.persistentID)")
                
                modelMusic.append(Music(persistentID: mediaItem.persistentID,title: title!, artist: artist!, assetURL: assetURL!, genre: genre))
            }
        }
        return modelMusic
    }
}
