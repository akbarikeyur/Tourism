//
//  CustomDebitCardTVC.swift
//  Tourism
//
//  Created by Keyur on 29/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomDebitCardTVC: UITableViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var cardLbl: Label!
    @IBOutlet weak var expireLbl: Label!
    @IBOutlet weak var cardTypebtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
