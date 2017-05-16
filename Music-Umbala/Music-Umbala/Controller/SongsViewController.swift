//
//  SongsViewController.swift
//  Music-Umbala
//
//  Created by Nam Vo on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import AVFoundation

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: *** Local Variables
    var songs:[String] = []
    var audioPlayer = AVAudioPlayer()
    var thisSong = 0
    var audioStuffed = false
    
    // MARK: *** UI Elements
    @IBOutlet weak var navigationSegmentedControl: UISegmentedControl!
    @IBOutlet weak var songsTableView: UITableView!
    
    // MARK: *** Data model
        
    // MARK: *** UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: *** UI Events
    
    @IBAction func changedNavigationSegmented(_ sender: UISegmentedControl) {
        // Clear all
        self.songs.removeAll()
        self.songsTableView.reloadData()
        
        if self.navigationSegmentedControl.selectedSegmentIndex == 0{
            // Handle if Recently Played is selected
            self.loadRecentlyPlayed()
        } else {
            // Handle if My Songs is selected
            self.loadMySongs()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let songTableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "songTableViewCell")
        songTableViewCell.textLabel?.text = songs[indexPath.row]
        return songTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
        } catch {
            NSLog("Error at UI Events: tableView_didSelectRowAt")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: *** EventHandlers
    
    func loadMySongs() {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in songPath {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3") {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
            }
            
            self.songsTableView.reloadData()
        } catch {
            NSLog("Error at Event Handler: loadMySongs")
        }
    }
    
    func loadRecentlyPlayed() {
        // TODO
    }
}
