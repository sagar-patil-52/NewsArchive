//
//  Agency.swift
//  NewsArchives
//
//  Created by MMT on 08/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//


import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
class Agency {
    
    var start_year: Int?
    var essay: String?
    var publisher: String?
//    var county: [String?]
//    var edition: String?
//    var frequency: String?
//    var url: String?
//    var id: String?
//    var subject: [String?]
    var city: [String?]?
    var language: [String?]?
    var title: String?
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
    
    init(json:[String: Any]) {
        start_year = json["start_year"] as? Int
        let esseyArr = json["essay"] as? [String] ?? [""]
        let str = esseyArr.count > 0 ? esseyArr[0] : ""
        let htmlStr = str.htmlToString
        essay = htmlStr;
        title = json["title"] as? String
        publisher = json["publisher"] as? String
        language = json["language"] as? [String] ?? [""]
        city = json["city"] as? [String] ?? [""]
    }
    
    init(start_year: Int?,essay:String?,title: String?,publisher: String?,language: [String?],city: [String?]){
        self.start_year = start_year;
        self.essay = essay;
        self.publisher = publisher;
        self.language = language;
        self.city = city;
        self.title = title;

    }
    
}
