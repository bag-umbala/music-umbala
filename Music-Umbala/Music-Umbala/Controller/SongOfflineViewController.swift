//
//  SongOfflineViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import MediaPlayer
import os.log
//import AVFoundation

class SongOfflineViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    // MARK: *** Data model
    var modelMusic : [Music]?
    var modelPlaylist : [Playlist]?
    var modelMusicSearchResults : [Music]?
    
    // MARK: *** UI Elements
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var Volume: UISlider!
    var mediaPicker: MPMediaPickerController?
    var myMusicPlayer: MPMusicPlayerController?
    let masterVolumeSlider: MPVolumeView = MPVolumeView()
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchBar: UISearchBar!
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    // MARK: *** UI events
    @IBAction func addPlaylist(_ sender: UIButton) {
        if let row = sender.superview?.superview?.tag {
            didSelectAddPlaylist = modelMusic?[row]
            let persistentID = didSelectAddPlaylist?.persistentID
            print("\(persistentID)")
//            modelPlaylist?.append(Playlist(arrPersistentID : [persistentID!]))
            
//            savePlaylist(mediaItemCollection: modelPlaylist)
//            PlaylistManager.all()
            
//            let alert = UIAlertController(title: "Thêm Vào Playlist", message: "Danh Sách Playlist", preferredStyle: .actionSheet)
//            let defaultAction = UIAlertAction(title: "Danh Sách Đã tại tại", style: .default) { (action) in
//                print("xem chi tiet")
//            }
//            let defaultAction = UIAlertAction(title: "Xem Chi Tiết Đặt Bàn", style: .default) { (action) in
//                print("xem chi tiet")
//            }
        }
    }
    
//    func savePlaylist(mediaItemCollection : [UInt64]) -> Bool {
//        if mediaItemCollection != nil {
//            
//        }
//    }
//    
//    func loadPlaylist(mediaItemCollection : [UInt64]) -> Bool {
//        if mediaItemCollection != nil {
//            
//        }
//    }
    
//    func savePlaylist(mediaItemCollection : MPMediaItemCollection) {
//        let items = mediaItemCollection.items
//        let listToSave : NSMutableArray = NSMutableArray.init()
//        for song in items {
//            let persistentID = song.persistentID
//            listToSave.add(persistentID)
//        }
//        
//        let data : Data = NSKeyedArchiver.archivedData(withRootObject: listToSave)
//        UserDefaults.standard.set(data, forKey: "song_name")
//        UserDefaults.standard.synchronize()
//    }
    
    @IBAction func playSong(_ sender: Any) {
        // play song
    }
    // MARK: *** Local variables
    var didSelectAddPlaylist : Music?
    
    // MARK: *** UIViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DB.createDBOrGetDBExist()
        PlaylistManager.createTable()
        
        // All
        let mediaItems = MPMediaQuery.songs().items
        
        // MARK: getMusicByMPMediaItem
//        if let mediaItemsU = mediaItems {
//            modelMusic = []
//            let mediaCollection = MPMediaItemCollection(items: mediaItemsU)
//            
//            let arrItem : [MPMediaItem] = mediaCollection.items
//            for mediaItem in arrItem {
//                let albumTitle = mediaItem.albumTitle
//                let albumArtist = mediaItem.albumArtist
//                let genre = mediaItem.genre
//                let title = mediaItem.title
//                let artist = mediaItem.artist
//                let artwork = mediaItem.artwork
//                let assetURL = mediaItem.assetURL
////                print("\(String(describing: assetURL))")
//                print("\(mediaItem.persistentID)")
//                
//                modelMusic?.append(Music(persistentID: mediaItem.persistentID,title: title!, artist: artist!, assetURL: assetURL!, genre: genre))
//            }
//            //            let player = MPMusicPlayerController.systemMusicPlayer()
//            //            player.setQueue(with: mediaCollection)
//            //
//            //            player.play()
//        }
        modelMusic = MPMediaMyExtension.getMusicByMPMediaItem(mediaItems: mediaItems)
        
        
        // Or you can filter on various property
        // Like the Genre for example here
//        var query = MPMediaQuery.songs()
//        let predicateByGenre = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre)
//        query.filterPredicates = NSSet(object: predicateByGenre) as! Set<MPMediaPredicate>
//        if let mediaItemsU = query.items {
//            let mediaCollection = MPMediaItemCollection(items: mediaItemsU)
//            
//            let arrItem : [MPMediaItem] = mediaCollection.items
//            for mediaItem in arrItem {
//                let albumTitle = mediaItem.albumTitle
//                let albumArtist = mediaItem.albumArtist
//                let genre = mediaItem.genre
//                let title = mediaItem.title
//                let artist = mediaItem.artist
//                let artwork = mediaItem.artwork
//                let assetURL = mediaItem.assetURL
//                print("\(String(describing: assetURL))")
//                //                listMusic.append(Music(title: title!, artist: artist!, assetURL: assetURL!, genre: genre))
//            }
//        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["Name"] //, "Genre"
        searchController.searchBar.delegate = self
        
        tableView?.tableHeaderView = searchController.searchBar
//        tableView?.tableHeaderView = searchBar
        definesPresentationContext = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        if let speciesDetailVC = segue.destination as? SongOfflineViewController
//        {
//            // gotta check if we're currently searching
//            if self.searchDisplayController!.isActive {
//                let indexPath = self.searchDisplayController?.searchResultsTableView.indexPathForSelectedRow
//                if indexPath != nil {
//                    speciesDetailVC.modelMusic = self.modelMusicSearchResults//?[indexPath!.row]
//                }
//            } else {
//                let indexPath = self.tableView?.indexPathForSelectedRow
//                if indexPath != nil {
//                    speciesDetailVC.modelMusic = self.modelMusic//?[indexPath!.row]
//                }
//            }
//        }
        switch segue.identifier ?? "" {
//        case "AddArea":
//            os_log("Adding a new Area.", log: OSLog.default, type: .debug)
        case "addPlaylistSegue":
            let navVC = segue.destination as? UINavigationController

            guard let addPlaylistViewController = navVC?.viewControllers.first as? AddPlaylistViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
//            guard let addPlaylistViewController = segue.destination as? AddPlaylistViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
            
            addPlaylistViewController.music = didSelectAddPlaylist
        default:
//            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            os_log("Default", log: OSLog.default, type: .debug)
        }
    }

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
    
    // MARK: Search
    func filterContentForSearchText(searchText: String, scope: Int) {
        // Filter the array using the filter method
        if self.modelMusic == nil {
            self.modelMusicSearchResults = nil
            return
        }
        self.modelMusicSearchResults = self.modelMusic!.filter({( aMusic: Music) -> Bool in
            var fieldToSearch: String?
            switch (scope) {
            case (0):
                fieldToSearch = aMusic.title
//            case (1):
//                fieldToSearch = aMusic.genre
            default:
                fieldToSearch = nil
            }
            if fieldToSearch == nil {
                self.modelMusicSearchResults = nil
                return false
            }
            return fieldToSearch!.lowercased().range(of: searchText.lowercased()) != nil
        })
    }
    
    
//    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
//        //        self.filterContentForSearchText(searchText: searchString)
//        //        return true
//        let selectedIndex = controller.searchBar.selectedScopeButtonIndex
//        self.filterContentForSearchText(searchText: searchString, scope: selectedIndex)
//        return true
//    }
//    
//    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
//        let searchString = controller.searchBar.text
//        self.filterContentForSearchText(searchText: searchString!, scope:searchOption)
//        return true
//    }

    // NEW
    func updateSearchResults(for searchController: UISearchController) {
        let selectedIndex = searchController.searchBar.selectedScopeButtonIndex
        let searchString = searchController.searchBar.text ?? ""
        filterContentForSearchText(searchText: searchString, scope: selectedIndex)
        tableView?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let searchString = searchBar.text ?? ""
        filterContentForSearchText(searchText: searchString, scope: selectedIndex)
        tableView?.reloadData()
    }
}
