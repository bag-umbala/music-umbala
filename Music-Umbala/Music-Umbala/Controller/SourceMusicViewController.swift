//
//  SourceMusicViewController.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/11/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit
import M13Checkbox

class SourceMusicViewController: UIViewController {

    // MARK: *** Data model
    
    // MARK: *** UI Elements
    @IBOutlet weak var chiaSeNhacCheckbox: M13Checkbox!
    @IBOutlet weak var zingMP3Checkbox: M13Checkbox!
    @IBOutlet weak var nhacCTCheckbox: M13Checkbox!
    @IBOutlet weak var keengCheckbox: M13Checkbox!
    @IBOutlet weak var allCheckbox: M13Checkbox!
    
    // MARK: *** UI events
    @IBAction func allCheckboxValueChanged(_ sender: M13Checkbox) {
        switch sender.checkState {
        case .unchecked:
            uncheckedAll()
            break
        case .checked:
            checkedAll()
            break
        case .mixed:
            break
        }
    }
    
    @IBAction func otherCheckboxValueChanged(_ sender: M13Checkbox) {
        
        switch sender.checkState {
        case .unchecked:
            if (othersCheckState() == CheckAllState.unchecked)
            {
                allCheckbox.setCheckState(.unchecked, animated: true)
            } else {
                allCheckbox.setCheckState(.mixed, animated: true)
            }
            break
        case .checked:
            if (othersCheckState() == CheckAllState.checked)
            {
                allCheckbox.setCheckState(.checked, animated: true)
            } else {
                allCheckbox.setCheckState(.mixed, animated: true)
            }
            break
        case .mixed:
            break
        }
    }
    
    @IBAction func Save(_ sender: UIButton) {
        getArraySourceMusicChoiced()
        defaults.setValue(sourcesMusic, forKey: "sourcesMusic")
        let getSourcesMusic = defaults.array(forKey: "sourcesMusic")
        print("UserDefaults key: sourcesMusic\nvalue: \(getSourcesMusic)")
    }
    
    // MARK: *** Local variables
    public enum CheckAllState: String {
        /// No check is shown.
        case unchecked = "Unchecked"
        /// A checkmark is shown.
        case checked = "Checked"
        /// A dash is shown.
        case mixed = "Mixed"
    }
    
    let defaults : UserDefaults = UserDefaults.standard
    
    /// chiaSeNhacCheckbox, zingMP3Checkbox, nhacCTCheckbox, keengCheckbox
    var sourcesMusic = [true, true, true, true]
    
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
    func checkedAll()
    {
        chiaSeNhacCheckbox.setCheckState(.checked, animated: true)
        zingMP3Checkbox.setCheckState(.checked, animated: true)
        nhacCTCheckbox.setCheckState(.checked, animated: true)
        keengCheckbox.setCheckState(.checked, animated: true)
    }
    
    func uncheckedAll()
    {
        chiaSeNhacCheckbox.setCheckState(.unchecked, animated: true)
        zingMP3Checkbox.setCheckState(.unchecked, animated: true)
        nhacCTCheckbox.setCheckState(.unchecked, animated: true)
        keengCheckbox.setCheckState(.unchecked, animated: true)
    }
    
    /// Trả về trạng thái của ô checkbox all nên chuyển thành
    func othersCheckState() -> CheckAllState {
        let arrCheckbox : [M13Checkbox] = [chiaSeNhacCheckbox, zingMP3Checkbox, nhacCTCheckbox, keengCheckbox]
        var count = 0
        for checkbox in arrCheckbox {
            switch checkbox.checkState {
            case .unchecked:
                break
            case .checked:
                count += 1
                break
            case .mixed:
                print("require check othersCheckState() .mixed")
                break
            }
        }
        
        if count == arrCheckbox.count {
            return CheckAllState.checked
        } else if (count == 0) {
            return CheckAllState.unchecked
        }
        return CheckAllState.mixed
    }
    
    /// Lấy mảng các nguồn được người dùng chọn, nó sẽ chỉ tìm kiếm từ nguồn này trong chức năng tìm nhạc online
    func getArraySourceMusicChoiced()
    {
        let arrCheckbox : [M13Checkbox] = [chiaSeNhacCheckbox, zingMP3Checkbox, nhacCTCheckbox, keengCheckbox]
        
        for (index, checkbox) in arrCheckbox.enumerated() {
            switch checkbox.checkState {
            case .unchecked:
                sourcesMusic[index] = false
                break
            case .checked:
                sourcesMusic[index] = true
                break
            case .mixed:
                print("require check arrayChoice() .mixed")
                break
            }
        }
    }
}
