//
//  TopicVC.swift
//  Tourism
//
//  Created by Keyur on 27/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import DropDown

class TopicVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var headerTitleLbl: Label!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var totalReplyLbl: Label!
    @IBOutlet weak var sortLbl: Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: "CustomTopicTVC", bundle: nil), forCellReuseIdentifier: "CustomTopicTVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToSort(_ sender: UIButton) {
        self.view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = sender
        dropDown.dataSource = ["Older First", "New First"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.sortLbl.text = item
        }
        dropDown.show()
    }
    
    @IBAction func clickToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- UITableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTopicTVC = tblView.dequeueReusableCell(withIdentifier: "CustomTopicTVC") as! CustomTopicTVC
        
        cell.bookmarkBtn.isSelected = (indexPath.row == 0)
        if indexPath.row == 1 {
            cell.imgView.isHidden = false
            cell.descLbl.text = ""
        }else{
            cell.imgView.isHidden = true
        }
        cell.contentView.backgroundColor = ClearColor
        cell.selectionStyle = .none
        return cell
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
