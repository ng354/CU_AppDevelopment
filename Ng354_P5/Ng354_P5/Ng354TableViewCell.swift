//
//  Ng354TableViewCell.swift
//  Ng354_P5
//
//  Created by Nikita Gupta on 10/26/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class Ng354TableViewCell: UITableViewCell {


    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var phoneLabel: UILabel!

    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var myImage: UIImageView!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
