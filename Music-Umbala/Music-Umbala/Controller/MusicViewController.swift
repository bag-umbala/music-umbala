//
//  MusicViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/16/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var playlistView: UIView!
    @IBOutlet weak var songOfflineView: UIView!
    @IBOutlet weak var songOnlineView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    // MARK: *** UI events
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        searchBar.isHidden = true
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
    
    @IBAction func search(_ sender: UIBarButtonItem) {
        print("search")
        searchBar.isHidden = false
    }
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.scopeButtonTitles = ["title"]
//        searchController.searchBar.delegate = self
        searchBar.delegate = self
        
//        tableview?.tableHeaderView = searchBar
        definesPresentationContext = true
        
        DB.createDBOrGetDBExist()
        
        playlistView.isHidden = false
        songOfflineView.isHidden = true
        songOnlineView.isHidden = true
        searchBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let searchString = searchBar.text ?? ""
//        filterContentForSearchText(searchString, scope: selectedIndex)
//        tableview?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let searchString = searchBar.text ?? ""
//        filterContentForSearchText(searchString, scope: selectedIndex)
//        tableview?.reloadData()
    }
}
