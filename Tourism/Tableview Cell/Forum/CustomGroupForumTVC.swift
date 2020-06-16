//
//  CustomGroupForumTVC.swift
//  Tourism
//
//  Created by Keyur on 27/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomGroupForumTVC: UITableViewCell {
    
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var joinBtn: Button!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var ByLbl: Label!
    @IBOutlet weak var dateLbl: Label!
    @IBOutlet weak var imgBtn1: Button!
    @IBOutlet weak var imgBtn2: Button!
    @IBOutlet weak var imgBtn3: Button!
    @IBOutlet weak var imgBtn4: Button!
    @IBOutlet weak var totalBtn: Button!
    @IBOutlet weak var imgView: ImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
