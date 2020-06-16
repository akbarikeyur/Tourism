//
//  CustomPostTVC.swift
//  Tourism
//
//  Created by Keyur on 29/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomPostTVC: UITableViewCell {

    @IBOutlet weak var outerview: View!
    @IBOutlet weak var profilePicImg: ImageView!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var timeLbl: Label!
    @IBOutlet weak var followBtn: Button!
    @IBOutlet weak var tagLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var voteBtn: Button!
    @IBOutlet weak var commentBtn: Button!
    @IBOutlet weak var user1Btn: Button!
    @IBOutlet weak var user2Btn: Button!
    @IBOutlet weak var user3Btn: Button!
    @IBOutlet weak var user4Btn: Button!
    @IBOutlet weak var imgBtn1: Button!
    @IBOutlet weak var imgBtn2: Button!
    @IBOutlet weak var imgBtn3: Button!
    @IBOutlet weak var imgBtn4: Button!
    @IBOutlet weak var imgBtn5: Button!
    @IBOutlet weak var imgBtn6: Button!
    @IBOutlet weak var imgBtn7: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
