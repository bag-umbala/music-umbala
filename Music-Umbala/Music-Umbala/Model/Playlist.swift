//
//  Playlist.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 5/18/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import Foundation

class Playlist {
    var id : Int32
    var name : String
    var arrPersistentID : [UInt64]
    var strArrPersistentID : String
    
    init(arrPersistentID: [UInt64]) {
        self.id = -1
        self.name = "Unname"
        self.arrPersistentID = arrPersistentID
        self.strArrPersistentID = ""
    }
    
    init(name: String, arrPersistentID: [UInt64]) {
        self.id = -1
        self.name = name
        self.arrPersistentID = arrPersistentID
        self.strArrPersistentID = ""
    }
    
    init(id : Int32, name: String, arrPersistentID: [UInt64]) {
        self.id = id
        self.name = name
        self.arrPersistentID = arrPersistentID
        self.strArrPersistentID = ""
    }
    
    init(id : Int32, arrPersistentID: [UInt64]) {
        self.id = id
        self.name = "Unname"
        self.arrPersistentID = arrPersistentID
        self.strArrPersistentID = ""
    }
}
