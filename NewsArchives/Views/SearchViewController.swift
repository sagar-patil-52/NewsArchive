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
    var viewModel : SearchViewModel = SearchViewModel()

    var agency:Agency = Agency.init(start_year: 0, essay: "essay", title: "", publisher: "", language: [""], city: [""])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
           let cell:TitleDetailsTableViewCell = searchTableview.dequeueReusableCell(withIdentifier: "TitleDetailsCell") as! TitleDetailsTableViewCell
        
        cell.publisher?.text = "Publisher: \(String(describing: agency.publisher!))"
        cell.title?.text = "Title: \(String(describing: agency.title!))"
        
        if agency.essay?.count != 0 {
            
            cell.essay?.text = "Essay: \(agency.essay!)"
        }
        
        if agency.city?.count != 0 {
            cell.city?.text = "City: \(agency.city?[0]! ?? "")"
            cell.region?.text = "Region: \(agency.city?[0]! ?? "")"
        }
        
        if agency.language?.count != 0 {
            cell.language?.text = "Language: \(agency.language?[0]! ?? "")"
        }
        
        // set the text from the data model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.searchTableview.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchTableview.estimatedRowHeight = 500
        self.searchTableview.rowHeight = UITableViewAutomaticDimension
        
        self.searchTableview.backgroundColor = UIColor.black;
        
        
        viewModel.searchIssues(closure: { (response) in
            self.searchTableview.reloadData()
        })
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
