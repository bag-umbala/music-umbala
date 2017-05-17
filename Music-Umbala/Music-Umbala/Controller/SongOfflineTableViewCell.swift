//
//  SongOfflineTableViewCell.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class SongOfflineTableViewCell: UITableViewCell {

    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singerOfSong: UILabel!
    @IBOutlet weak var playSong: UIButton!
    
    
    // MARK: *** UI events
    
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
