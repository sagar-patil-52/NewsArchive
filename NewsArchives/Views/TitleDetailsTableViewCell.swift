//
//  TitleDetailsTableViewCell.swift
//  NewsArchives
//
//  Created by MMT on 09/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//
import UIKit

class TitleDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publisher: UILabel!
    
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var startYear: UILabel!
    
    @IBOutlet weak var essay: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
