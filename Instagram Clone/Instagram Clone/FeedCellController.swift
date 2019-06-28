//
//  FeedCellController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/28/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class FeedCellController: UITableViewCell {

    @IBOutlet var image_view: UIImageView!
    
    @IBOutlet var user_info: UILabel!
    
    @IBOutlet var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
