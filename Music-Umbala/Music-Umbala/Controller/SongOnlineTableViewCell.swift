//
//  SongOnlineTableViewCell.swift
//  Music-Umbala
//
//  Created by Nam Vo on 6/15/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class SongOnlineTableViewCell: UITableViewCell {
    
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
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
