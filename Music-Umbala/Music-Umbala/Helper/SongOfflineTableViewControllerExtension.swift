//
//  SongOfflineTableViewControllerExtension.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/18/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer

extension SongOfflineViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return modelMusic.count;
//        if tableView == self.searchDisplayController!.searchResultsTableView {
        if searchController.isActive {
            return self.modelMusicSearchResults?.count ?? 0
        } else {
            return self.modelMusic?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SongOfflineCell", for: indexPath) as! SongOfflineTableViewCell
//        let ms = modelMusic?[indexPath.row]
//        cell.songName.text = ms?.title
//        cell.singerOfSong.text = ms?.artist
//        cell.tag = indexPath.row
        
        // MARK: *** search
        let cell = self.tableView!.dequeueReusableCell(withIdentifier: "SongOfflineCell") as! SongOfflineTableViewCell
        
        var arrayOfMusic : Array<Music>?
//        if tableView == self.searchDisplayController!.searchResultsTableView {
        if searchController.isActive {
            arrayOfMusic = self.modelMusicSearchResults
        } else {
            arrayOfMusic = self.modelMusic
        }
        
        if arrayOfMusic != nil && arrayOfMusic!.count >= indexPath.row
        {
            let ms = arrayOfMusic![indexPath.row]
            cell.songName.text = ms.title
            cell.singerOfSong.text = ms.artist
            cell.tag = indexPath.row
        }
        
        if !searchController.isActive {
            // Load more species if needed
            // see https://grokswift.com/rest-tableview-in-swift/ for details
        }
//        if !searchController.isActive {
//            // See if we need to load more species
//            let rowsToLoadFromBottom = 5;
//            let rowsLoaded = self.modelMusic!.count
//            if (!self.isLoadingSpecies && (indexPath.row >= (rowsLoaded - rowsToLoadFromBottom))) {
//                if let totalRows = self.speciesWrapper?.count {
//                    let remainingSpeciesToLoad = totalRows - rowsLoaded;
//                    if (remainingSpeciesToLoad > 0) {
//                        self.loadMoreSpecies()
//                    }
//                }
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let url : URL = NSFileProviderExtension.urlForItem(withPersistentIdentifier identifier: "3434287249036538171")
//        print("\(url)")
        
        let collection = MPMediaMyExtension.queryMedia(identifier: (modelMusic?[indexPath.row].persistentID)!)
        if collection.count == 1 {
            let storyboard = UIStoryboard(name: "Player", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Player") as! PlayerViewController
            let data = collection.representativeItem
            // let viewController = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
            NSLog(data.debugDescription)
            viewController.data = data
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
}
