//
//  CustomSideMenuTVC.swift
//  Tourism
//
//  Created by PC on 21/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class CustomSideMenuTVC: UITableViewCell {

    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var nextArrowBtn: UIButton!
    @IBOutlet weak var downArrowBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
