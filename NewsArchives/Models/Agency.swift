//
//  Agency.swift
//  NewsArchives
//
//  Created by MMT on 08/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//


import Foundation
class Agency {
    
    var start_year: Int?
    var essay: [String?]
//    var publisher: String?
//    var county: [String?]
//    var edition: String?
//    var frequency: String?
//    var url: String?
//    var id: String?
//    var subject: [String?]
//    var city: [String?]
//    var language: [String?]
//    var title: String?
//    var holding_type: [String?]
//    var end_year: Int?
//    var alt_title: [String?]
//    var note: [String?]
//    var lccn: String?
//    var state: [String?]
//    var place: [String?]
//    var country: String?
//    var type: String?
//    var title_normal: String?
//    var oclc: String?

   
//    init(id: Int?,icon: String?,desc: String?,limit: Int?,next: Int?,aname: String?,specialaddon: Int?){
//
//        self.id = id
//        self.icon = icon
//        self.desc = desc
//        self.limit = limit
//        self.next = next
//        self.aname = aname
//        self.specialaddon = specialaddon
//
//    }
    init(start_year: Int?,essay: [String?]){
        self.start_year = start_year;
        self.essay = essay;
    }
    
}