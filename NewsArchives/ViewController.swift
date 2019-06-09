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
    var agencyArray:[Agency] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:TitleTableViewCell = self.titleTableview.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleTableViewCell!
        
        cell.title.text = agencyArray[indexPath.row].title;
        cell.language.text = agencyArray[indexPath.row].language[0];
        cell.publisher.text = agencyArray[indexPath.row].publisher;
        cell.region.text = agencyArray[indexPath.row].city[0];
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "AgencyDetails", sender: self.agencyArray[indexPath.row])
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
                
                guard let agncyArr = response as? [Agency] else{
                    return;
                }
                
                self.agencyArray = agncyArr;
                self.titleTableview.reloadData()
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AgencyDetails")
        {
            let vc:SearchViewController = segue.destination as! SearchViewController
            let agency:Agency = (sender as? Agency)!
            vc.agencyArr = [["Title":agency.title],["City":agency.city[0]]] as! [[String : String]];
        }
    }
}

