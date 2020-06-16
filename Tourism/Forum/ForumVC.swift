//
//  ForumVC.swift
//  Tourism
//
//  Created by Keyur on 27/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import DropDown

class ForumVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var discussionBtn: Button!
    @IBOutlet weak var discussImgView: ImageView!
    @IBOutlet weak var groupBtn: Button!
    @IBOutlet weak var groupImgView: ImageView!
    
    @IBOutlet var discussionHeaderView: UIView!
    @IBOutlet weak var discussProfilePicImg: ImageView!
    @IBOutlet weak var discussTitleLbl: Label!
    @IBOutlet weak var discussGroupLbl: Label!
    @IBOutlet weak var discussDescLbl: Label!
    @IBOutlet weak var totalDiscussTopicsLbl: Label!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet var groupHeaderView: UIView!
    @IBOutlet weak var groupProfilePicImg: ImageView!
    @IBOutlet weak var groupTitleLbl: Label!
    @IBOutlet weak var groupActLbl: Label!
    @IBOutlet weak var groupDescLbl: Label!
    @IBOutlet weak var totalGroupBtn: Button!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: "CustomDiscussionForumTVC", bundle: nil), forCellReuseIdentifier: "CustomDiscussionForumTVC")
        tblView.register(UINib.init(nibName: "CustomGroupForumTVC", bundle: nil), forCellReuseIdentifier: "CustomGroupForumTVC")
        setUIDesigning()
    }
    
    func setUIDesigning()
    {
        discussionBtn.setTitleColor(LightGrayColor, for: .normal)
        discussionBtn.setTitleColor(DarkGrayColor, for: .selected)
        groupBtn.setTitleColor(LightGrayColor, for: .normal)
        groupBtn.setTitleColor(DarkGrayColor, for: .selected)
        clickToSelectTab(discussionBtn)
    }
    
    //MARK: - Button click event
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToSelectTab(_ sender: Button) {
        discussionBtn.isSelected = false
        groupBtn.isSelected = false
        sender.isSelected = true
        discussImgView.isHidden = !discussionBtn.isSelected
        groupImgView.isHidden = !groupBtn.isSelected
        tblView.tableHeaderView = nil
        if discussionBtn.isSelected {
            tblView.tableHeaderView = discussionHeaderView
        }
        else{
            tblView.tableHeaderView = groupHeaderView
        }
        tblView.reloadData()
    }
    
    @IBAction func clickToAskQuestion(_ sender: Any) {
        
    }
    
    @IBAction func clickToDiscussGroup(_ sender: UIButton) {
        self.view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = sender
        dropDown.dataSource = ["Group 1", "Group 2", "Group 3", "Group 4", "Group 5"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.discussGroupLbl.text = item
        }
        dropDown.show()
    }
    
    @IBAction func clickToDiscussSmile(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToDiscussImageVideo(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToSubmitDiscuss(_ sender: Any) {
        
    }
    
    @IBAction func clickToFilterDiscuss(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToCreateGroup(_ sender: Any) {
        
    }
    
    @IBAction func clickToSelectGroupActivityGroup(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToFilterGroup(_ sender: UIButton) {
        
    }
    
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if discussionBtn.isSelected {
            let cell : CustomDiscussionForumTVC = tblView.dequeueReusableCell(withIdentifier: "CustomDiscussionForumTVC") as! CustomDiscussionForumTVC
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = ClearColor
            return cell
        }
        else{
            let cell : CustomGroupForumTVC = tblView.dequeueReusableCell(withIdentifier: "CustomGroupForumTVC") as! CustomGroupForumTVC
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = ClearColor
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if discussionBtn.isSelected {
            let vc : TopicVC = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "TopicVC") as! TopicVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if groupBtn.isSelected {
            let vc : ActivityDetailVC = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "ActivityDetailVC") as! ActivityDetailVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
