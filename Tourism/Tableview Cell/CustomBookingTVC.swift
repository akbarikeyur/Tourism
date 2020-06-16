//
//  CustomBookingTVC.swift
//  Tourism
//
//  Created by Keyur on 23/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomBookingTVC: UITableViewCell {

    @IBOutlet weak var imgView: ImageView!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var subTitleLbl: Label!
    @IBOutlet weak var starBtn: Button!
    @IBOutlet weak var dateBtn: Button!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var eyeBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
