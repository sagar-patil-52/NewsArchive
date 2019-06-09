//
//  TitleTableViewCell.swift
//  NewsArchives
//
//  Created by MMT on 05/06/19.
//  Copyright © 2019 Shaunak Jagtap. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publisher: UILabel!
    
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var language: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
