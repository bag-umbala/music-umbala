//
//  PlayerViewController.swift
//  Music-Umbala
//
//  Created by Nam Vo on 6/15/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer

class PlayerViewController: UIViewController {
    
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    // MARK: *** UI events
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: *** Local variables
    var data: MPMediaItemCollection!
    var musicPlayer: MPMusicPlayerController!

    // MARK: *** UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getSong() {
        self.titleLabel.text = self.data.representativeItem?.title
        self.artistLabel.text = self.data.representativeItem?.artist
        
        musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
        musicPlayer.setQueue(with: self.data)
        musicPlayer.repeatMode = MPMusicRepeatMode.all
        musicPlayer.shuffleMode = MPMusicShuffleMode.songs
        musicPlayer.play()
    }
}
