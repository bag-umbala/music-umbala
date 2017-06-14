//
//  AddPlaylistViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/22/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class AddPlaylistViewController: UIViewController {

    // MARK: *** Data model
    var modelPlaylist : [Playlist] = [Playlist]()
    
    // MARK: *** UI Elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newPlaylistView: UIView!
    
    // MARK: *** UI events
    @IBAction func backAddPlaylist(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        performSegueToReturnBack()
//        self.navigationController?.popViewController(animated: true)
    }
    
    func addNewPlaylist(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "SegueToNewPlaylistID", sender: self)
    }
    
    // MARK: *** Local variables
    var didSelectIdPlaylist : Int32 = -1
    var music : Music?
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DB.createDBOrGetDBExist()
        modelPlaylist = PlaylistManager.all()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        let gesture = UITapGestureRecognizer(target: self, action: "addNewPlaylist:")
//        // or for swift 2 +
//        let gestureSwift2AndHigher = UITapGestureRecognizer(target: self, action:  #selector (self.addNewPlaylist (_:)))
//        self.myView.addGestureRecognizer(gesture)
        var touch = UITapGestureRecognizer(target: self, action: #selector(addNewPlaylist))
        newPlaylistView.addGestureRecognizer(touch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToNewPlaylistID" {
            let dest = segue.destination as! NewPlaylistVC
            
            // lấy persistentID
            dest.song = music?.persistentID
        }
    }

}
