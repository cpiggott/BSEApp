//
//  ExistingGroupTableViewCell.swift
//  BSE
//
//  Created by Chris Piggott on 11/9/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

class ExistingGroupTableViewCell: UITableViewCell {

    @IBOutlet var existingGroupName: UILabel!
    
    @IBOutlet var existingGroupDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
