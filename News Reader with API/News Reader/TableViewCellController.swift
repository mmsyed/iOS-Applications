//
//  TableViewCellController.swift
//  News Reader
//
//  Created by Mo Syed on 6/20/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var title2: UILabel!
    @IBOutlet var cell_img: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
