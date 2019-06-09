//
//  AgencyViewModel.swift
//  NewsArchives
//
//  Created by MMT on 09/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation

class AgencyViewModel{
    
    var agencyArray : [Agency] = []
    var pageNumber = 0;
    
    func fetchAgencies(closure:@escaping (_ completion: Any) -> Void) {
        let apilinks = ApiLinks.init()
        pageNumber += 1
        let anotherWebServiceHandler = WebServiceHandler.init()
        anotherWebServiceHandler.fetchDataFromWebService(url:apilinks.getAgencySearchUrl(page: pageNumber),method:.get,[:], closure:
            {
                response in
                
                let dictionary = response as? [String: Any]
                if let agencyDict = dictionary?["items"] as? [[String:Any]] {
                    for agencyObj in agencyDict
                    {
                        let agency:Agency = Agency.init(json: agencyObj)
                        self.agencyArray.append(agency)
                    }
                    
                    closure("Success")
                }
                else{
                    closure(response)
                }
                
        })
        
        
    }
    
    
    
    
}
