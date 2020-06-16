//
//  PostListVC.swift
//  Tourism
//
//  Created by Keyur on 29/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomUserStoryCVC : UICollectionViewCell {
    @IBOutlet var outerView: View!
    @IBOutlet weak var joinBtn: Button!
    @IBOutlet weak var liveBtn: UIButton!
}

class PostListVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var followingLbl: Label!
    @IBOutlet weak var followerLbl: Label!
    @IBOutlet weak var totalMsgBtn: Button!
    @IBOutlet weak var addFriendBtn: UIButton!
    @IBOutlet weak var userCV: UICollectionView!
    @IBOutlet weak var thaughtTxt: TextField!
    @IBOutlet weak var searchTxt: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: "CustomPostTVC", bundle: nil), forCellReuseIdentifier: "CustomPostTVC")
        tblView.tableHeaderView = headerView
        tblView.reloadData()
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToAddFriend(_ sender: Any) {
        
    }
    
    @IBAction func clickToPost(_ sender: Any) {
        
    }
    
    //MARK:- UICollectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomUserStoryCVC = userCV.dequeueReusableCell(withReuseIdentifier: "CustomUserStoryCVC", for: indexPath) as! CustomUserStoryCVC
        cell.liveBtn.isHidden = (indexPath.row != 1)
        if indexPath.row == 0 {
            cell.outerView.backgroundColor = YellowColor
            cell.joinBtn.setBackgroundImage(nil, for: .normal)
            cell.joinBtn.backgroundColor = YellowColor
            cell.joinBtn.setImage(UIImage.init(named: "send_msg"), for: .normal)
            cell.outerView.layer.borderColor = ClearColor.cgColor
            cell.joinBtn.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4.0)
        }
        else{
            cell.outerView.backgroundColor = ClearColor
            cell.outerView.layer.borderColor = PinkColor.cgColor
            cell.outerView.layer.borderWidth = 1
            cell.joinBtn.backgroundColor = ClearColor
            cell.joinBtn.setImage(nil, for: .normal)
            cell.joinBtn.setBackgroundImage(UIImage.init(named: "profile_user"), for: .normal)
        }
        return cell
    }
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomPostTVC = tblView.dequeueReusableCell(withIdentifier: "CustomPostTVC") as! CustomPostTVC
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
