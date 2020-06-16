//
//  CustomDealCVC.swift
//  Tourism
//
//  Created by Keyur on 29/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import FSPagerView

class CustomDealCVC: FSPagerViewCell {

    @IBOutlet weak var imgView: ImageView!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var unitLbl: Label!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var bookNowBtn: Button!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
