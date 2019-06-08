//
//  ViewController.swift
//  NewsArchives
//
//  Created by Sagar  Patil on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var titleTableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.titleTableview.dequeueReusableCell(withIdentifier: "TitleCell") as UITableViewCell!
        
        // set the text from the data model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.titleTableview.estimatedRowHeight = 140
        self.titleTableview.rowHeight = UITableViewAutomaticDimension
        self.titleTableview.backgroundColor = UIColor.black;

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

