//
//  ViewController.swift
//  NewsArchives
//
//  Created by Sagar  Patil on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
updateDeviceToken()
        
    }

    func updateDeviceToken() {
        let anotherWebServiceHandler = WebServiceHandler.init()
        anotherWebServiceHandler.fetchDataFromWebServicePost([:], closure:
            {
                response in
                
                print(response);
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

