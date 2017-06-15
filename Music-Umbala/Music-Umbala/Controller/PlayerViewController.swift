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
    var data: MPMediaItem!
    
    // MARK: *** UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func getSong() {
        self.titleLabel.text = self.data.title
        self.artistLabel.text = self.data.artist
        
        let itemURL = data.value(forProperty: MPMediaItemPropertyAssetURL) as! URL
        let audioItem = AVPlayerItem(url: itemURL)
        let audioPlayer = AVPlayer(playerItem: audioItem)
        audioPlayer.play()
    }
}
