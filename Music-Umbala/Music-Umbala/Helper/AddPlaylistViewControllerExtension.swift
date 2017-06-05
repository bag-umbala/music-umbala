//
//  AddPlaylistViewControllerExtension.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/22/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer

extension AddPlaylistViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPlaylist.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistTableViewCell
        let ms = modelPlaylist[indexPath.row]
        cell.namePlaylistLabel.text = ms.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playlist = modelPlaylist[indexPath.row]
        if playlist.id != -1 {
            print("Controller: \(playlist.name)")
            didSelectIdPlaylist = playlist.id
            let playlistAdd : Playlist = playlist
            if music != nil {
                if (!playlist.arrPersistentID.contains((music?.persistentID)!))
                {
                    playlistAdd.arrPersistentID.append((music?.persistentID)!)
                    
                    let stringArray = playlistAdd.arrPersistentID.flatMap { String($0) }
                    playlistAdd.strArrPersistentID = stringArray.joined(separator: ",")
                    print(playlistAdd.strArrPersistentID)
                    if PlaylistManager.update(obj: playlistAdd) != nil {
                        self.dismiss(animated: true, completion: nil)
                        alert("Success", message: "Thêm vào Playlist thành công!")
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadPlaylistTables"), object: nil)
                        //                    if (movetoroot) {
                        //                        _ = self?.navigationController?.popToRootViewController(animated: true)
                        //                    } else {
                        //                        _ = navigationController?.popViewController(animated: true)
                        //                    }
                    } else {
                        alert("Fail", message: "Thêm vào Playlist thất bại!")
                    }
                } else {
                    alert("Fail", message: "Đã có trong Playlist rồi!")
                    performSegueToReturnBack()
                }
            }
        }
    }
    
    func queryMedia(identifier : UInt64) -> MPMediaItemCollection {
        
        let predicateId = MPMediaPropertyPredicate(value: identifier, forProperty: MPMediaItemPropertyPersistentID, comparisonType: MPMediaPredicateComparison.equalTo)
        
        let query = MPMediaQuery.init()
        query.addFilterPredicate(predicateId)
        
        let collection = MPMediaItemCollection(items: query.items!)
        
        return collection;
    }
    
}
