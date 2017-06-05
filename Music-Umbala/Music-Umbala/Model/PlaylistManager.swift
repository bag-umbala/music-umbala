//
//  PlaylistManager.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/19/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import Foundation

class PlaylistManager {
    
    static let entityName = "Playlist"
    
    // Create Table
    static func createTable() {
        let sqlStatement = "create table \(entityName) (id integer primary key autoincrement not null, name string not null, arrPersistentID string not null default '');"
        
        var statement_handle : OpaquePointer?
        if sqlite3_prepare_v2(DB.db, sqlStatement, -1, &statement_handle, nil) == SQLITE_OK {
            if sqlite3_step(statement_handle) == SQLITE_DONE {
                print("Model: Created table \(entityName)")
            } else {
                print("Model: Create table \(entityName) Fail! when run step")
                print(String(cString: sqlite3_errmsg(DB.db)))
            }
        } else {
            print("Model: Create table \(entityName) Fail!")
            print(String(cString: sqlite3_errmsg(DB.db)))
        }
        sqlite3_finalize(statement_handle)
    }
    
    static func all() -> [Playlist] {
        var lsS : [Playlist] = [Playlist]()
        let selectQ = "SELECT * FROM \(entityName);"
        
        var statement_handle : OpaquePointer? = nil
        if sqlite3_prepare_v2(DB.db, selectQ, -1, &statement_handle, nil) == SQLITE_OK {
            while sqlite3_step(statement_handle) == SQLITE_ROW {
                let id = sqlite3_column_int(statement_handle, 0)
                let name = String(cString: sqlite3_column_text(statement_handle, 1))
                let sarrPersistentID = String(cString: sqlite3_column_text(statement_handle, 2)).characters.split(separator: ",").map(String.init)
                print("Model: \(sarrPersistentID)")
                let arrPersistentID = sarrPersistentID.map { UInt64.init($0)! }
                
                lsS.append(Playlist(id: id, name: name, arrPersistentID: arrPersistentID))
            }
        }  else {
            print("Model: Select statement to table \(entityName) don't prepared")
            print(String(cString: sqlite3_errmsg(DB.db)))
        }
        sqlite3_finalize(statement_handle)
        return lsS
    }
    
    static func update(obj: Playlist) -> Playlist? {
        
        let updateQ = "UPDATE \(entityName) SET arrPersistentID = '\(obj.strArrPersistentID)' WHERE id = \(obj.id);"
        
        var statement_handle : OpaquePointer?
        if sqlite3_prepare_v2(DB.db, updateQ, -1, &statement_handle, nil) == SQLITE_OK {
            if sqlite3_step(statement_handle) == SQLITE_DONE {
                print("Model: Updated a \(entityName) id = \(obj.id) to table \(entityName)")
                
                sqlite3_finalize(statement_handle)
                return obj
            } else {
                print("Model: Updated a \(entityName) id = \(obj.id) to table \(entityName) Fail! when run step")
                print(String(cString: sqlite3_errmsg(DB.db)))
            }
        } else {
            print("Model: Updated a \(entityName) id = \(obj.id) to table \(entityName) Fail!")
            print("Model: \(String(cString: sqlite3_errmsg(DB.db)))")
        }
        sqlite3_finalize(statement_handle)
        
        return nil
    }
    
    static func getMusic(by playlist: Playlist) -> [UInt64] {
        
        var lsS : [UInt64] = [UInt64]()
        let selectQ = "SELECT * FROM \(entityName) where id = '\(playlist.id)'"
        
        var statement_handle : OpaquePointer? = nil
        if sqlite3_prepare_v2(DB.db, selectQ, -1, &statement_handle, nil) == SQLITE_OK {
            while sqlite3_step(statement_handle) == SQLITE_ROW {
                let id = sqlite3_column_int(statement_handle, 0)
                let name = String(cString: sqlite3_column_text(statement_handle, 1))
                let sarrPersistentID = String(cString: sqlite3_column_text(statement_handle, 2)).characters.split(separator: ",").map(String.init)
                print("Model: \(sarrPersistentID)")
                let arrPersistentID = sarrPersistentID.map { UInt64.init($0)! }
                
                lsS = arrPersistentID
            }
        }  else {
            print("Model: Select statement to table \(entityName) don't prepared")
            print(String(cString: sqlite3_errmsg(DB.db)))
        }
        sqlite3_finalize(statement_handle)
        return lsS
    }
}
