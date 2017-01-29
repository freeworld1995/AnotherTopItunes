//
//  SongCell.swift
//  AnotherTopItunes
//
//  Created by Jimmy Hoang on 1/28/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songImage: CustomImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var price: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
