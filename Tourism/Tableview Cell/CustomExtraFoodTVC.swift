//
//  CustomExtraFoodTVC.swift
//  Tourism
//
//  Created by Keyur on 22/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomExtraFoodTVC: UITableViewCell {

    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var successBtn: UIButton!
    @IBOutlet weak var addBtn: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
