//
//  SearchViewController.swift
//  NewsArchives
//
//  Created by MMT on 06/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableview: UITableView!

    var agencyArr:[[String:String]] = [[:]]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agencyArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.searchTableview.dequeueReusableCell(withIdentifier: "SearchCell") as UITableViewCell!
        
        cell.textLabel?.text = agencyArr[indexPath.row].description
        // set the text from the data model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchTableview.estimatedRowHeight = 140
        self.searchTableview.rowHeight = UITableViewAutomaticDimension
        
        self.searchTableview.backgroundColor = UIColor.black;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
