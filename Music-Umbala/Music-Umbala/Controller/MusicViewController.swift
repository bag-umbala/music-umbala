//
//  MusicViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var playlistView: UIView!
    @IBOutlet weak var songOfflineView: UIView!
    @IBOutlet weak var songOnlineView: UIView!
    
    // MARK: *** UI events
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            playlistView.isHidden = false
            songOfflineView.isHidden = true
            songOnlineView.isHidden = true
        case 1:
            playlistView.isHidden = true
            songOfflineView.isHidden = false
            songOnlineView.isHidden = true
        case 2:
            playlistView.isHidden = true
            songOfflineView.isHidden = true
            songOnlineView.isHidden = false
        default:
            break;
        }
    }
    
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistView.isHidden = false
        songOfflineView.isHidden = true
        songOnlineView.isHidden = true
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

}
