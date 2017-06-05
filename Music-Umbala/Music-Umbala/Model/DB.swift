//
//  DB.swift
//  Food-Umbala
//
//  Created by Nam Nguyen on 4/21/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import Foundation

class DB {
    // Truy cập đến đối tượng object context chung
    static var db : OpaquePointer?
    
    // Hàm tạo cơ sở dữ liệu
    static func createDBOrGetDBExist() {
        // Create DB on Documnet Dir
        let documnetURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dataPath = documnetURL.appendingPathComponent("Music.db").path
        
        var data_tmp : OpaquePointer?
        if sqlite3_open(dataPath, &data_tmp) == SQLITE_OK {
            print("DB created")
            print("dataPath \(dataPath)")
            db = data_tmp
        } else {
            print("DB create Fail!")
            print(String(cString: sqlite3_errmsg(db)))
            db = nil
        }
    }
}
