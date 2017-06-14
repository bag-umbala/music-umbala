//
//  ListDownloadVC.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/13/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class ListDownloadVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: *** UI events
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listDownloadIdentifier", for: indexPath) as! ListDownLoadTableViewCell
//        let obj = 
        cell.nameSongDownloadLabel.text = "Tên Bài Hát Download"
        cell.percentDownloadLabel.text = "100%"
        cell.percentDownloadProgressV.setProgress(100, animated: true)
        return cell
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
