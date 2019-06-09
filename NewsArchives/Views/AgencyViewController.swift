//
//  AgencyViewController.swift
//  NewsArchives
//
//  Created by Shaunak Jagtap on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import UIKit

class AgencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var titleTableview: UITableView!
    var viewModel : AgencyViewModel = AgencyViewModel()
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    @IBAction func segmentChanges(_ sender: Any) {
        viewModel.agencyArray = []
        if segmentedControl.selectedSegmentIndex == 1 {
            viewModel.agencyArray = StorageHandler.shared.getStoredAgencies()
            handelResult(response: viewModel.agencyArray)
        }
        else {
            viewModel.fetchAgencies(closure: { (response) in
                self.handelResult(response: response)
            })
        }
        titleTableview.reloadData();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleTableview.estimatedRowHeight = 140
        titleTableview.rowHeight = UITableViewAutomaticDimension
        titleTableview.backgroundColor = UIColor.black
        
        viewModel.fetchAgencies(closure: { (response) in
            self.handelResult(response: response)
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if segmentedControl.selectedSegmentIndex == 1 {
            return true
        }
        else{
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .destructive, title: "Delete") { (_, index) in
            // delete model object at the index
            StorageHandler.shared.deleteAgency(title: self.viewModel.agencyArray[indexPath.row].title ?? "")
            self.viewModel.agencyArray.remove(at: index.row)
            self.titleTableview.beginUpdates()
            self.titleTableview.deleteRows(at: [index], with: .automatic)
            self.titleTableview.endUpdates()
            
        }
        return [action]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.agencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:TitleTableViewCell = titleTableview.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleTableViewCell
        
        cell.title.text = viewModel.agencyArray[indexPath.row].title;
        cell.language.text = viewModel.agencyArray[indexPath.row].language?[0];
        cell.publisher.text = viewModel.agencyArray[indexPath.row].publisher;
        cell.region.text = viewModel.agencyArray[indexPath.row].city?[0];
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: titleTableview.bounds.width, height: CGFloat(44))
        footerView.frame = CGRect.init(x: 0, y: 0, width: titleTableview.bounds.width, height: 44)
        footerView.addSubview(spinner)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return spinner.isAnimating ? 44 : 0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 && !spinner.isAnimating {
            
            spinner.startAnimating()
            viewModel.fetchAgencies(closure: { (response) in
                self.handelResult(response: response)
            })
        }
        

        
    }
    
    func handelResult(response:Any) {
        spinner.stopAnimating()

        if let error = response as? Error {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        self.titleTableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailViewController = segue.destination as? SearchViewController,
            let index = titleTableview.indexPathForSelectedRow?.row,
            let agency = viewModel.agencyArray[index] as? Agency
            else {
                return
        }
        
        StorageHandler.shared.storeData(agency: agency)
        StorageHandler.shared.getStoredAgencies()
        
        detailViewController.agency = agency;
    }
}

