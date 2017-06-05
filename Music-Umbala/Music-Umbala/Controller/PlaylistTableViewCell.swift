//
//  PlaylistTableViewCell.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/19/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var namePlaylistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
