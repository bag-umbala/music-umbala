//
//  PlaylistDetailTableViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/2/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var editTable: UIBarButtonItem!
    
    // MARK: *** UI events
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backPlaylist(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
    }
    
    @IBAction func toogleEditTableDetail(_ sender: UIBarButtonItem) {
        if (self.tableView.isEditing)
        {
            sender.title = "Edit"
            self.tableView.isEditing = false
        } else {
            sender.title = "Done"
            self.tableView.isEditing = true
        }
        self.isEditing = true
    }
    
    // MARK: *** Local variables
    var playlist : Playlist?
    var modelMusic : [Music]?
    
    // MARK: *** UIViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationController?.navigationBar.isHidden = false
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if playlist != nil {
//        PlaylistManager.getMusic(by: playlist!)
            if let uwArrPersistentID = playlist?.arrPersistentID {
                let aMediaItems = MPMediaMyExtension.queryPlaylist(lstID: uwArrPersistentID)
                modelMusic = MPMediaMyExtension.getMusicByMPMediaItem(mediaItems: aMediaItems)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.modelMusic?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistDetailCell", for: indexPath) as! PlaylistDetailTableViewCell
        
        let ms = modelMusic?[indexPath.row]
        cell.songName.text = ms?.title
        cell.singerOfSong.text = ms?.artist
        cell.tag = indexPath.row
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print("class: \(self.classForCoder) \(delete)")
            modelMusic?.remove(at: indexPath.row)
            
            if (playlist != nil) {
                playlist?.arrPersistentID.remove(at: indexPath.row)
                playlist?.processBeforeSave()
                PlaylistManager.update(obj: playlist!)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
