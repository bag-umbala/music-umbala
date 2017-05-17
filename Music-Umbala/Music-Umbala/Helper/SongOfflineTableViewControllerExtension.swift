//
//  SongOfflineTableViewControllerExtension.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/18/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

extension SongOfflineViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMusic.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongOfflineCell", for: indexPath) as! SongOfflineTableViewCell
        let ms = listMusic[indexPath.row]
        cell.songName.text = ms.title
        cell.singerOfSong.text = ms.artist
        
        return cell
    }
    
}
