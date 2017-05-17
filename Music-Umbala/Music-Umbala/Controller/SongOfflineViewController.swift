//
//  SongOfflineViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class SongOfflineViewController: UIViewController {
    
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var Volume: UISlider!
    var mediaPicker: MPMediaPickerController?
    var myMusicPlayer: MPMusicPlayerController?
    let masterVolumeSlider: MPVolumeView = MPVolumeView()
    var listMusic : [Music] = []
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: *** UI events
    @IBAction func addPlaylist(_ sender: Any) {
        
    }
    
    @IBAction func playSong(_ sender: Any) {
        // play song
    }
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // All
        let mediaItems = MPMediaQuery.songs().items
        // Or you can filter on various property
        // Like the Genre for example here
        var query = MPMediaQuery.songs()
        let predicateByGenre = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre)
        query.filterPredicates = NSSet(object: predicateByGenre) as! Set<MPMediaPredicate>
        
        if let mediaItemsU = mediaItems {
            let mediaCollection = MPMediaItemCollection(items: mediaItemsU)
            
            let arrItem : [MPMediaItem] = mediaCollection.items
            for mediaItem in arrItem {
                let albumTitle = mediaItem.albumTitle
                let albumArtist = mediaItem.albumArtist
                let genre = mediaItem.genre
                let title = mediaItem.title
                let artist = mediaItem.artist
                let artwork = mediaItem.artwork
                let assetURL = mediaItem.assetURL
                print("\(String(describing: assetURL))")
                listMusic.append(Music(title: title!, artist: artist!, assetURL: assetURL!, genre: genre))
            }
            //            let player = MPMusicPlayerController.systemMusicPlayer()
            //            player.setQueue(with: mediaCollection)
            //
            //            player.play()
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
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

    func mediaPicker(_ mediaPicker: MPMediaPickerController,
                     didPickMediaItems mediaItemCollection: MPMediaItemCollection){
        
        
        myMusicPlayer = MPMusicPlayerController()
        
        if let player = myMusicPlayer{
            player.beginGeneratingPlaybackNotifications()
            
            player.setQueue(with: mediaItemCollection)
            player.play()
            self.updateNowPlayingItem()
            
            mediaPicker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func displayMediaPickerAndPlayItem(){
//        mediaPicker = MPMediaPickerController(mediaTypes: .anyAudio)
//        
//        if let picker = mediaPicker{
//            
//            print("Successfully instantiated a media picker")
//            picker.delegate = self
//            view.addSubview(picker.view)
//            present(picker, animated: true, completion: nil)
//            
//        } else {
//            print("Could not instantiate a media picker")
//        }
    }
    
    func nowPlayingItemIsChanged(_ notification: Notification){
        
        print("Playing Item Is Changed")
        
        let key = "MPMusicPlayerControllerNowPlayingItemPersistentIDKey"
        
        let persistentID =
            notification.userInfo![key] as? NSString
        
        if let id = persistentID{
            print("Persistent ID = \(id)")
        }
        
    }
    
    func volumeIsChanged(_ notification: Notification){
        print("Volume Is Changed")
    }
    
    func updateNowPlayingItem(){
        if let nowPlayingItem=self.myMusicPlayer!.nowPlayingItem{
            let nowPlayingTitle=nowPlayingItem.title
            self.nowPlayingLabel.text=nowPlayingTitle
        }else{
            self.nowPlayingLabel.text="Nothing Played"
        }
    }
    
    
    @IBAction func openItunesLibraryTapped(_ sender: AnyObject) {
        
//        displayMediaPickerAndPlayItem()
    }
    
    @IBAction func sliderVolume(_ sender: AnyObject) {
        if let view = masterVolumeSlider.subviews.first as? UISlider{
            view.value = sender.value
        }
    }
}
