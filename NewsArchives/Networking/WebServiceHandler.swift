//
//  NetworkManager.swift
//  NewsArchives
//
//  Created by Sagar  Patil on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceHandler : NSObject {
    
    
    override init() {
        // perform some initialization here
        
    }
    
    
    func processSingleRecord() -> Bool {
        return false
    }
    
    func getWebServiceUrl() -> String{
        return ApiLinks().deviceTokenLink();
    }
    func DisplayNetworkAvailabilityMessage()-> String{
        return "network failed"
    }
    
    func fetchDataFromWebServicePost(_ parameters: Dictionary<String , AnyObject>, closure:@escaping (_ completion: Any) -> Void) {
        
        let url = getWebServiceUrl()
        Alamofire.request(url, method: .get, parameters: nil, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            //                print(response.data)     // server data
//            print("Result",response.result)   // result of response serialization
//            print("parameters = \(parameters)")
            if let JSON = response.result.value {
                //                print("JSON: \(JSON)")
            }
            //TODO:Dismiss HUD
            switch response.result {
            case .success(_):
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    
                    
                    if let dictionary = response.result.value as? [String: Any] {
                        
                        if let agencyDict = dictionary["items"] as? [[String:Any]] {
                            var agencyArray = [Agency]()
                            
                            for agencyObj in agencyDict
                            {
                                let agency:Agency = Agency.init(start_year: agencyObj["start_year"] as? Int, essay: agencyObj["essay"] as? [String] ?? [], title: agencyObj["title"] as? String, publisher: agencyObj["publisher"] as? String, language: agencyObj["language"] as? [String] ?? [], city: agencyObj["city"] as? [String] ?? [])
                                agencyArray.append(agency)
                            }
                            print(agencyArray.count)
                            
                            closure(agencyArray)

                        }
                        
                        
                    }
                    
                    
                    if self.processSingleRecord() == true {
                        //Map single object
                    }
                }
                else if response.response?.statusCode == 0{
                    
                }
                else  {
                    if let _ = response.result.value as? Error {
                    }
                }
            case .failure(let error):
                debugPrint("getEvents error: \(error)")
                //TODO:Dismiss HUD
            }
            }.responseString { response in
                //                print("Success: \(response.result.isSuccess)")
                //                print("Response String: \(response.result.value)")
        }
    } }
