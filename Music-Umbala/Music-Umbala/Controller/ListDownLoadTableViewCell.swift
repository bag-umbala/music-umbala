//
//  ListDownLoadTableViewCell.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/13/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class ListDownLoadTableViewCell: UITableViewCell {

    @IBOutlet weak var nameSongDownloadLabel: UILabel!
    @IBOutlet weak var percentDownloadLabel: UILabel!
    @IBOutlet weak var percentDownloadProgressV: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
