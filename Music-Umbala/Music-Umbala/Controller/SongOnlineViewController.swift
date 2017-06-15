//
//  SongOnlineViewController.swift
//  Music-Umbala
//
//  Created by Nam Vo on 6/15/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class SongOnlineViewController: UIViewController {
    
    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var songsTableView: UITableView!
    
    // MARK: *** UI events
    
    // MARK: *** Local variables
    var songs: [Song] = []
    
    // MARK: *** UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSongs()
        
        self.songsTableView.delegate = self
        self.songsTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func getSongs() {
        let url = URL(string: "http://j.ginggong.com/jOut.ashx?h=mp3.zing.vn&code=306c622f-521d-484d-8c23-57e7ae65534e")
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                for song in json as! [AnyObject] {
                    self.songs.append(Song(title: song["title"] as! String, artist: song["artist"] as! String))
                }
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
}
