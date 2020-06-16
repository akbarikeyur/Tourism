//
//  CustomDiscussionForumTVC.swift
//  Tourism
//
//  Created by Keyur on 26/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomDiscussionForumTVC: UITableViewCell {

    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var totalBtn: Button!
    @IBOutlet weak var byLbl: Label!
    @IBOutlet weak var dateLbl: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
