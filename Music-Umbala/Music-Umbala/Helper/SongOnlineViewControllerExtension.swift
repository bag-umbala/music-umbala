//
//  SongOnlineViewController.swift
//  Music-Umbala
//
//  Created by Nam Vo on 6/15/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

extension SongOnlineViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SongOnlineTableViewCell"
        
        guard let cell = songsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SongOnlineTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SongOnlineTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let song = songs[indexPath.row]
        
        cell.titleLabel.text = song.title
        cell.artistLabel.text = song.artist
        
        return cell
    }
}
