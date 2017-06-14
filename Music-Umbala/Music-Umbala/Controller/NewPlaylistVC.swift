//
//  NewPlaylistViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/15/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class NewPlaylistVC: UIViewController {

    // MARK: *** Data model
    
    // MARK: *** Local variables
    var song : UInt64?
    
    // MARK: *** UI Elements
    @IBOutlet weak var nameNewPlaylistTextField: UITextField!
    
    // MARK: *** UI events
    @IBAction func saveButton(_ sender: Any) {
        if song == nil {
            alert("Fail", message: "Add Song to Playlist error!") { _ in }
        } else {
            PlaylistManager.insert(obj: Playlist(name: nameNewPlaylistTextField.text!, arrPersistentID: [song!]))
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadPlaylistTables"), object: nil)
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
