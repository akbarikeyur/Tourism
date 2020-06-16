//
//  CustomTopicTVC.swift
//  Tourism
//
//  Created by Keyur on 27/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomTopicTVC: UITableViewCell {

    @IBOutlet weak var profilePicImg: ImageView!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var durationLbl: Label!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var imgBtn1: Button!
    @IBOutlet weak var imgBtn2: Button!
    @IBOutlet weak var imgBtn3: Button!
    @IBOutlet weak var imgBtn4: Button!
    @IBOutlet weak var imgBtn5: Button!
    @IBOutlet weak var imgBtn6: Button!
    @IBOutlet weak var reviewLbl: Label!
    @IBOutlet weak var voteBtn: Button!
    @IBOutlet weak var commentBtn: Button!
    @IBOutlet weak var replyBtn: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
