//
//  PlaylistViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/19/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {

    // MARK: *** Data model
    var modelPlaylist : [Playlist]?
    var modelPlaylistSearchResults : [Playlist]?
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    // MARK: *** UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: *** UI events
    
    // MARK: *** Local variables
    let didSelectIdPlaylist : Int32 = -1
    var didSelectPlaylist : Playlist?
    
    // MARK: *** UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DB.createDBOrGetDBExist()
        modelPlaylist = PlaylistManager.all()

        
        NotificationCenter.default.addObserver(self, selector: #selector(loadPlaylistTables), name: NSNotification.Name(rawValue: "loadPlaylistTables"), object: nil)
        

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["Name"] //, "ID"
        searchController.searchBar.delegate = self
        
        tableView?.tableHeaderView = searchController.searchBar
//        definesPresentationContext = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let speciesDetailVC = segue.destination as? PlaylistDetailViewController
        {
            speciesDetailVC.playlist = didSelectPlaylist
//                let indexPath = self.searchDisplayController?.searchResultsTableView.indexPathForSelectedRow
//                if indexPath != nil {
//                    speciesDetailVC.playlist =
//                }
        }
    }
    
    func loadPlaylistTables() {
        modelPlaylist = PlaylistManager.all()
        self.tableView.reloadData() // Cập nhật giao diện
    }
    
    // MARK: Search
    func filterContentForSearchText(searchText: String, scope: Int) {
        // Filter the array using the filter method
        if self.modelPlaylist == nil {
            self.modelPlaylistSearchResults = nil
            return
        }
        self.modelPlaylistSearchResults = self.modelPlaylist!.filter({( aPlaylist: Playlist) -> Bool in
            var fieldToSearch: String?
            switch (scope) {
            case (0):
                fieldToSearch = aPlaylist.name
//            case (1):
//                fieldToSearch = "\(aPlaylist.id)"
            default:
                fieldToSearch = nil
            }
            if fieldToSearch == nil {
                self.modelPlaylistSearchResults = nil
                return false
            }
            return fieldToSearch!.lowercased().range(of: searchText.lowercased()) != nil
        })
    }
    
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
