//
//  ProfileVC.swift
//  Tourism
//
//  Created by Keyur on 28/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profilePicBtn: UIButton!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var usernameLbl: Label!
    @IBOutlet weak var totalPostLbl: Label!
    @IBOutlet weak var totalFollowingLbl: Label!
    @IBOutlet weak var totalFollowerLbl: Label!
    @IBOutlet weak var personalBtn: Button!
    @IBOutlet weak var hobbiesBtn: Button!
    @IBOutlet weak var billingBtn: Button!
    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet var personalInfoView: UIView!
    @IBOutlet weak var unameTxt: TextField!
    @IBOutlet weak var emailTxt: TextField!
    @IBOutlet weak var phoneTxt: TextField!
    @IBOutlet weak var genderTxt: TextField!
    @IBOutlet weak var dobTxt: TextField!
    @IBOutlet weak var descTxtView: TextView!
    
    @IBOutlet var hobbiesView: UIView!
    @IBOutlet weak var hobbieCV: UICollectionView!
    
    @IBOutlet var billingView: UIView!
    @IBOutlet weak var cardTblview: UITableView!
    @IBOutlet weak var constraintHeightCardTblView: NSLayoutConstraint!
    @IBOutlet weak var cardNumberTxt: TextField!
    @IBOutlet weak var cardHolderTxt: TextField!
    @IBOutlet weak var cardMonthTxt: TextField!
    @IBOutlet weak var cardYeartxt: TextField!
    @IBOutlet weak var cardCVVTxt: TextField!
    
    var arrInterestName = ["Sports", "Eating", "Park", "Rides", "Clubs", "Traveling", "Swimming", "Exercise", "Golf"]
    var arrInterestImage = ["ic_sport", "ic_eating", "ic_park", "ic_ride", "ic_club", "ic_travel", "ic_swimming", "ic_exercise", "ic_golf"]
    var arrSelected = [Int]()
    var selectedCard : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hobbieCV.register(UINib.init(nibName: "CustomActivityCVC", bundle: nil), forCellWithReuseIdentifier: "CustomActivityCVC")
        cardTblview.register(UINib.init(nibName: "CustomDebitCardTVC", bundle: nil), forCellReuseIdentifier: "CustomDebitCardTVC")
        setUIDesigning()
    }
    
    func setUIDesigning()
    {
        totalPostLbl.attributedText = attributedStringWithColor(totalPostLbl.text!, ["Posts"], color: LightGrayColor)
        totalFollowingLbl.attributedText = attributedStringWithColor(totalFollowingLbl.text!, ["Following"], color: LightGrayColor)
        totalFollowerLbl.attributedText = attributedStringWithColor(totalFollowerLbl.text!, ["Follower"], color: LightGrayColor)
        clickToSelectTab(personalBtn)
        constraintHeightCardTblView.constant = 70 * 2
    }
    
    //MARK:- Button click event
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToEdit(_ sender: Any) {
        
    }
    
    @IBAction func clickToEditProfilePic(_ sender: Any) {
        
    }
    
    @IBAction func clickToSelectTab(_ sender: Button) {
        resetTab()
        self.view.endEditing(true)
        if sender == personalBtn {
            personalBtn.titleLabel?.font = UIFont.init(name: APP_BOLD, size: 14)
            displaySubViewtoParentView(mainContainerView, subview: personalInfoView)
        }
        else if sender == hobbiesBtn {
            hobbiesBtn.titleLabel?.font = UIFont.init(name: APP_BOLD, size: 14)
            displaySubViewtoParentView(mainContainerView, subview: hobbiesView)
        }
        else if sender == billingBtn {
            billingBtn.titleLabel?.font = UIFont.init(name: APP_BOLD, size: 14)
            displaySubViewtoParentView(mainContainerView, subview: billingView)
        }
    }
    
    func resetTab()
    {
        personalBtn.titleLabel?.font = UIFont.init(name: APP_REGULAR, size: 14)
        hobbiesBtn.titleLabel?.font = UIFont.init(name: APP_REGULAR, size: 14)
        billingBtn.titleLabel?.font = UIFont.init(name: APP_REGULAR, size: 14)
        personalInfoView.removeFromSuperview()
        hobbiesView.removeFromSuperview()
        billingView.removeFromSuperview()
    }
    
    
    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN.WIDTH/4.0, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomActivityCVC = hobbieCV.dequeueReusableCell(withReuseIdentifier: "CustomActivityCVC", for: indexPath) as! CustomActivityCVC
        cell.imgBtn.setImage(UIImage.init(named: arrInterestImage[indexPath.row]), for: .normal)
        cell.titleLbl.text = arrInterestName[indexPath.row]
        cell.selectBtn.isHidden = !arrSelected.contains(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = arrSelected.firstIndex { (temp) -> Bool in
            temp == indexPath.row
        }
        if index == nil {
            arrSelected.append(indexPath.row)
        }else{
            arrSelected.remove(at: index!)
        }
        hobbieCV.reloadData()
    }
    
    //MARK:- Collectionview method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomDebitCardTVC = cardTblview.dequeueReusableCell(withIdentifier: "CustomDebitCardTVC") as! CustomDebitCardTVC
        cell.selectBtn.isSelected = (indexPath.row == selectedCard)
        if (indexPath.row != selectedCard) {
            cell.expireLbl.text = ""
        }
        else{
            cell.expireLbl.text = "Expiring soon!"
        }
        
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = ClearColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCard = indexPath.row
        cardTblview.reloadData()
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
