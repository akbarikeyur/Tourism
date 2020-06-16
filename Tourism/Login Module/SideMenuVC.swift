//
//  SideMenuVC.swift
//  BeatBox
//
//  Created by PC on 15/06/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

struct MENU {
    
    static let HOME = NSLocalizedString("menu_home", comment: "")
    static let PLAN_TRIP = NSLocalizedString("menu_plan_trip", comment: "")
    static let INTERESTS = NSLocalizedString("menu_interests", comment: "")
    static let DEALS = NSLocalizedString("menu_deal", comment: "")
    static let RECOMMEND = NSLocalizedString("menu_recommendations", comment: "")
    static let BOOKING = NSLocalizedString("menu_booking", comment: "")
    static let FORUM = NSLocalizedString("menu_forum", comment: "")
    static let GROUP_ACTIVITY = NSLocalizedString("menu_group_activity", comment: "")
    static let COMMUNITY = NSLocalizedString("menu_community", comment: "")
    static let WALL = NSLocalizedString("menu_wall", comment: "")
    static let BLANK = NSLocalizedString("menu_blank", comment: "")
    static let PROFILE = NSLocalizedString("menu_profile", comment: "")
    static let SETTINGS = NSLocalizedString("menu_Settings", comment: "")
    
    
    static let CATEGORY = NSLocalizedString("menu_category", comment: "")
    static let RESTAURANTS = NSLocalizedString("menu_restaurants", comment: "")
    static let HOTEL = NSLocalizedString("menu_hotel", comment: "")
    static let ADVENTURE = NSLocalizedString("menu_adventure", comment: "")
    static let SAFARI = NSLocalizedString("menu_safari", comment: "")
    static let ROAD = NSLocalizedString("menu_road", comment: "")
    static let CINEMA = NSLocalizedString("menu_cinema", comment: "")
    static let CLUB = NSLocalizedString("menu_club", comment: "")
    static let TRAVEL = NSLocalizedString("menu_travel", comment: "")
    static let OTHERS = NSLocalizedString("menu_other", comment: "")
    
}

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profilePicBtn: Button!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var emailLbl: Label!
    @IBOutlet weak var followingLbl: Label!
    @IBOutlet weak var followerLbl: Label!
    @IBOutlet weak var msgCountBtn: Button!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var constraintHeightTblView: NSLayoutConstraint!
    
    var arrMenuData = [MENU.HOME, MENU.PLAN_TRIP, MENU.INTERESTS, MENU.DEALS, MENU.RECOMMEND, MENU.BOOKING, MENU.FORUM, MENU.GROUP_ACTIVITY, MENU.COMMUNITY, MENU.WALL, MENU.BLANK, MENU.PROFILE, MENU.SETTINGS]
    var arrCategoryData = [MENU.CATEGORY, MENU.RESTAURANTS, MENU.HOTEL, MENU.ADVENTURE, MENU.SAFARI, MENU.ROAD, MENU.CINEMA, MENU.CLUB, MENU.TRAVEL, MENU.OTHERS]
    var isDealExpand = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateUserData), name: NSNotification.Name.init(NOTIFICATION.UPDATE_CURRENT_USER_DATA), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToMyBooking), name: NSNotification.Name.init(NOTIFICATION.REDIRECT_MY_BOOKING), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToPlanMyTrip), name: NSNotification.Name.init(NOTIFICATION.REDIRECT_PLAN_TRIP), object: nil)
        
        tblView.register(UINib.init(nibName: "CustomSideMenuTVC", bundle: nil), forCellReuseIdentifier: "CustomSideMenuTVC")
        constraintHeightTblView.constant = CGFloat(arrMenuData.count * 45)
        updateUserData()
    }
    
    @objc func updateUserData() {
        
    }
    
    @objc func navigateToMyBooking()
    {
        let navController = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "MyBookingsVCNav") as! UINavigationController
        navController.isNavigationBarHidden = true
        menuContainerViewController.centerViewController = navController
    }
    
    @objc func navigateToPlanMyTrip()
    {
        let navController = STORYBOARD.HOME.instantiateViewController(withIdentifier: "PlanYourTripVCNav") as! UINavigationController
        navController.isNavigationBarHidden = true
        menuContainerViewController.centerViewController = navController
    }
    
    
    //MARK: - Button Click
    
    @IBAction func clickToLogout(_ sender: Any) {
        showAlertWithOption("Logout", message: "Are you sure want to logout?", btns: ["Yes", "No"], completionConfirm: {
            
        }) {
            AppDelegate().sharedDelegate().logout()
        }
        
    }
    
    @IBAction func clickToFollowing(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToFollower(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToMessage(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    //MARK: - TableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrMenuData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell : CustomSideMenuTVC = tblView.dequeueReusableCell(withIdentifier: "CustomSideMenuTVC") as! CustomSideMenuTVC
        cell.titleLbl.text = arrMenuData[section]
        cell.nextArrowBtn.isHidden = true
        if arrMenuData[section] == MENU.DEALS {
            cell.downArrowBtn.isHidden = false
            cell.downArrowBtn.isSelected = isDealExpand
        }else{
            cell.downArrowBtn.isHidden = true
        }
        if arrMenuData[section] == MENU.PROFILE || arrMenuData[section] == MENU.SETTINGS {
            cell.titleLbl.textColor = DarkGrayColor
            cell.titleLbl.font = UIFont.init(name: APP_BOLD, size: 18)
        }else{
            cell.titleLbl.textColor = LightGrayColor
            cell.titleLbl.font = UIFont.init(name: APP_REGULAR, size: 18)
        }
        cell.menuBtn.isHidden = false
        cell.menuBtn.tag = section
        cell.menuBtn.addTarget(self, action: #selector(clickToMenubtn(_:)), for: .touchUpInside)
        return cell
    }
    
    @IBAction func clickToMenubtn(_ sender: UIButton) {
        if arrMenuData[sender.tag] != MENU.DEALS {
            self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        }
        
        switch arrMenuData[sender.tag] {
        case MENU.HOME:
            let navController = STORYBOARD.HOME.instantiateViewController(withIdentifier: "MyLocationVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
            break
        case MENU.PLAN_TRIP:
            let navController = STORYBOARD.HOME.instantiateViewController(withIdentifier: "PlanYourTripVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
            break
        case MENU.INTERESTS:
            let vc : InterestsVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "InterestsVC") as! InterestsVC
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case MENU.RECOMMEND:
            
            break
        case MENU.BOOKING:
            let navController = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "MyBookingsVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
            break
        case MENU.FORUM:
            let navController = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "ForumVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
            break
        case MENU.COMMUNITY:
            let vc : AddFriendsVC = STORYBOARD.PROFILE.instantiateViewController(withIdentifier: "AddFriendsVC") as! AddFriendsVC
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case MENU.WALL:
            let vc : PostListVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "PostListVC") as! PostListVC
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case MENU.PROFILE:
            let navController = STORYBOARD.PROFILE.instantiateViewController(withIdentifier: "ProfileVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
            break
        case MENU.SETTINGS:
            
            break
        case MENU.DEALS:
            isDealExpand = !isDealExpand
            tblView.reloadData()
            if isDealExpand {
                constraintHeightTblView.constant = CGFloat((arrMenuData.count * 45) + (arrCategoryData.count * 35))
            }else{
                constraintHeightTblView.constant = CGFloat((arrMenuData.count * 45))
            }
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDealExpand && arrMenuData[section] == MENU.DEALS {
            return arrCategoryData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomSideMenuTVC = tblView.dequeueReusableCell(withIdentifier: "CustomSideMenuTVC", for: indexPath) as! CustomSideMenuTVC
        cell.menuBtn.isHidden = true
        cell.nextArrowBtn.isHidden = false
        cell.downArrowBtn.isHidden = true
        cell.titleLbl.text = arrCategoryData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        if arrCategoryData[indexPath.row] == MENU.CATEGORY {
            let navController = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "AllDealsVCNav") as! UINavigationController
            navController.isNavigationBarHidden = true
            menuContainerViewController.centerViewController = navController
        }
        else{
            let vc : RestaurantsListVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsListVC") as! RestaurantsListVC
            vc.selectedCategory = arrCategoryData[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
