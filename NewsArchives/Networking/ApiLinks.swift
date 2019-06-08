//
//  AppLinks.swift
//  NewsArchives
//
//  Created by Sagar  Patil on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation
class ApiLinks : NSObject {
    
    var prod = Bool()
    var dev = Bool()
    var httpPart = "https://"
    
    var localHost = "chroniclingamerica.loc.gov"
    
    
    var apiExtension = "search/titles/results/?city=&rows=20&terms=&language=&lccn=&material_type=&year1=1690&year2=2019&labor=&county=&state=&frequency=&ethnicity=&page=7765&sort=relevance&format=json"
    var separater = "/"
    var host = String()
    
    static let sharedInstance = ApiLinks()
    
//    //handle the dev or prod modes
//    func setTheProdStatus(_ prodVaule : Bool) {
//        prod = prodVaule
//        if(prod) {
//            host = prodHost
//        } else {
//            host = localHost
//        }
//    }
    
    let deviceToken = "" // your api name here
    func deviceTokenLink() -> String {
        return "\(self.httpPart)\(localHost)\(self.separater)\(self.deviceToken)\(self.apiExtension)"
        
}
    
}
