//
//  CustomMovieDetailTVC.swift
//  Tourism
//
//  Created by Keyur on 03/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomMovieDetailTVC: UITableViewCell {
    
    @IBOutlet weak var categoryLbl: Label!
    @IBOutlet weak var namebtn: Button!
    @IBOutlet weak var subTitleLbl: Label!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var topseperatorImg: ImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
