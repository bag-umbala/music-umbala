//
//  PlaylistViewControllerExtension.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/19/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer

extension PlaylistViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return modelPlaylist?.count ?? 0
        if searchController.isActive {
            return self.modelPlaylistSearchResults?.count ?? 0
        } else {
            return self.modelPlaylist?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistTableViewCell
//        let ms = modelPlaylist?[indexPath.row]
//        cell.namePlaylistLabel.text = ms?.name

        // MARK: *** search
        let cell = self.tableView!.dequeueReusableCell(withIdentifier: "PlaylistCell") as! PlaylistTableViewCell
        
        var arrayOfPlaylist : Array<Playlist>?
        if searchController.isActive {
            arrayOfPlaylist = self.modelPlaylistSearchResults
        } else {
            arrayOfPlaylist = self.modelPlaylist
        }
        
        if arrayOfPlaylist != nil && arrayOfPlaylist!.count >= indexPath.row
        {
            let ms = arrayOfPlaylist![indexPath.row]
            cell.namePlaylistLabel.text = ms.name
            cell.tag = indexPath.row
        }
        
        if !searchController.isActive {
            // Load more species if needed
            // see https://grokswift.com/rest-tableview-in-swift/ for details
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let collection = queryMedia(identifier: modelPlaylist[indexPath.row].arrPersistentID[0])
//        if collection.count == 1 {
//            print("\(collection.count)")
//            // add event play music
//        }
        didSelectPlaylist = modelPlaylist?[indexPath.row]
    }
    
    func queryMedia(identifier : UInt64) -> MPMediaItemCollection {
        
        let predicateId = MPMediaPropertyPredicate(value: identifier, forProperty: MPMediaItemPropertyPersistentID, comparisonType: MPMediaPredicateComparison.equalTo)
        
        let query = MPMediaQuery.init()
        query.addFilterPredicate(predicateId)
        
        let collection = MPMediaItemCollection(items: query.items!)
        
        return collection;
    }
}
