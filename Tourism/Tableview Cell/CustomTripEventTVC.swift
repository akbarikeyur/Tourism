//
//  CustomTripEventTVC.swift
//  Tourism
//
//  Created by Keyur on 02/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomTripEventTVC: UITableViewCell {

    @IBOutlet weak var profilePicImg: ImageView!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var dateLbl: Label!
    @IBOutlet weak var timeLbl: Label!
    @IBOutlet weak var seperatorImg: ImageView!
    @IBOutlet weak var dotImg: ImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
