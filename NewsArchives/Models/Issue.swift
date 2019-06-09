//
//  Issue.swift
//  NewsArchives
//
//  Created by Shaunak Jagtap on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation
class Issue {
    
    var id: Int?
    var icon: String?
    var desc: String?
    var limit: Int?
    var next: Int?
    var aname: String?
    var specialaddon: Int?
    
    init(id: Int?,icon: String?,desc: String?,limit: Int?,next: Int?,aname: String?,specialaddon: Int?){
        
        self.id = id
        self.icon = icon
        self.desc = desc
        self.limit = limit
        self.next = next
        self.aname = aname
        self.specialaddon = specialaddon
        
    }
    
}
