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

    var agency:Agency = Agency.init(start_year: 0, essay: ["essay"], title: "", publisher: "", language: [""], city: [""])
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
           let cell:TitleDetailsTableViewCell = searchTableview.dequeueReusableCell(withIdentifier: "TitleDetailsCell") as! TitleDetailsTableViewCell!
        
        cell.publisher?.text = "Publisher: \(String(describing: agency.publisher?.description))"
        cell.title?.text = "Title: \(String(describing: agency.title!))"

        if let essayCellText = agency.essay[0] {
            cell.essay?.text = "Essay: \(essayCellText))"
        }
        
        if let regionCellText = agency.city[0] {
            cell.region?.text = "Region: \(regionCellText))"
        }
        
        
        cell.city?.text = "City: \(String(describing: agency.city[0]?.description))"
        cell.language?.text = "Language: \(String(describing: agency.language[0]?.description))"


        // set the text from the data model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
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
