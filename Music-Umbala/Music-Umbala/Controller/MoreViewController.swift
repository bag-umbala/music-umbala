//
//  MoreViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/12/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var MultiLanguage: UIView!
    @IBOutlet weak var SourceMusic: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: *** UI events
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            MultiLanguage.isHidden = true
            SourceMusic.isHidden = false
        case 1:
            MultiLanguage.isHidden = false
            SourceMusic.isHidden = true
        default:
            break;
        }
    }
    
    // MARK: *** Local variables
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        MultiLanguage.isHidden = true
        SourceMusic.isHidden = false
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
