//
//  SearchViewModel.swift
//  NewsArchives
//
//  Created by MMT on 09/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation

class SearchViewModel{
    
    var agencyArray : [Agency]!
    var pageNumber = 0;
    
    func searchIssues(closure:@escaping (_ completion: Any) -> Void) {
        let apilinks = ApiLinks.init()
        pageNumber = 1 + pageNumber
        let webServiceHandler = WebServiceHandler.init()
        webServiceHandler.fetchDataFromWebService(url:apilinks.getAgencySearchUrl(page: 7765),method:.get,[:], closure:
            {
                response in
                
                let dictionary = response as? [String: Any]
                if let agencyDict = dictionary?["items"] as? [[String:Any]] {
                    var agencyArr = [Agency]()
                    
                    for agencyObj in agencyDict
                    {
                        let agency:Agency = Agency.init(json: agencyObj)
                        agencyArr.append(agency)
                    }
                    
                    self.agencyArray = agencyArr;
                    closure("Success")
                }
                
        })
        
        
    }
    
    
    
    
}
