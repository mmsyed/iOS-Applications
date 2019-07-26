//
//  TableViewCell.swift
//  Energize
//
//  Created by Mo Syed on 7/23/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var item_label: UILabel!
    
    @IBOutlet var item_qt: UITextField!
    
    @IBOutlet var item_img: UIImageView!
    
    @IBOutlet var item_price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
    }
}