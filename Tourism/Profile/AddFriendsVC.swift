//
//  AddFriendsVC.swift
//  Tourism
//
//  Created by Keyur on 01/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class AddFriendsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchTxt: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: "CustomAddFriendTVC", bundle: nil), forCellReuseIdentifier: "CustomAddFriendTVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToClearAll(_ sender: Any) {
        searchTxt.text = ""
        tblView.reloadData()
    }
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomAddFriendTVC = tblView.dequeueReusableCell(withIdentifier: "CustomAddFriendTVC") as! CustomAddFriendTVC
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
