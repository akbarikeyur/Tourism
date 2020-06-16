//
//  PlanYourTripVC.swift
//  Tourism
//
//  Created by Keyur on 02/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomPlanDayCVC : UICollectionViewCell {
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var seperatorImg: ImageView!
}

class CustomTripCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var profilePicBtn: Button!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var timeLbl: Label!
    @IBOutlet weak var userBtn1: Button!
    @IBOutlet weak var userBtn2: Button!
    @IBOutlet weak var userBtn3: Button!
    @IBOutlet weak var userBtn4: Button!
}

class PlanYourTripVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var planCV: UICollectionView!
    @IBOutlet weak var tripCV: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var noDataFoundView: View!
    
    var arrPlanData = ["All Plans", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var selectedDay = ""
    var arrTimeData = ["09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedDay = arrPlanData[0]
        planCV.reloadData()
        
        tblView.register(UINib.init(nibName: "CustomTripEventTVC", bundle: nil), forCellReuseIdentifier: "CustomTripEventTVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToBookTrip(_ sender: Any) {
        
    }
    
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    
    //MARK:- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == planCV {
            return arrPlanData.count
        }
        else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == planCV {
            let newLable : UILabel = UILabel.init()
            newLable.font = UIFont.init(name: APP_REGULAR, size: 14.0)
            newLable.text = arrPlanData[indexPath.row]
            let width = newLable.intrinsicContentSize.width
            return CGSize(width: width + 20, height: collectionView.frame.size.height)
        }
        else{
            return CGSize(width: 200, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == planCV {
            let cell : CustomPlanDayCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomPlanDayCVC", for: indexPath) as! CustomPlanDayCVC
            cell.titleLbl.text = arrPlanData[indexPath.row]
            if selectedDay == arrPlanData[indexPath.row] {
                cell.titleLbl.textColor = DarkGrayColor
                cell.seperatorImg.isHidden = false
            }else{
                cell.titleLbl.textColor = LightGrayColor
                cell.seperatorImg.isHidden = true
            }
            return cell
        }
        else {
            let cell : CustomTripCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomTripCVC", for: indexPath) as! CustomTripCVC
            if indexPath.row % 2  == 0 {
                cell.colorView.backgroundColor = GreenColor
            }else{
                cell.colorView.backgroundColor = PinkColor
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == planCV {
            selectedDay = arrPlanData[indexPath.row]
            planCV.reloadData()
        }
    }
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTimeData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTripEventTVC = tblView.dequeueReusableCell(withIdentifier: "CustomTripEventTVC") as! CustomTripEventTVC
        cell.timeLbl.text = arrTimeData[indexPath.row]
        cell.profilePicImg.isHidden = false
        if indexPath.row == 1 {
            cell.nameLbl.text = "Aquaventure Waterpark"
            cell.dateLbl.text = "Mon 09:30 pm"
            cell.seperatorImg.backgroundColor = GreenColor
            cell.dotImg.backgroundColor = GreenColor
        }
        else if indexPath.row == 3 {
            cell.nameLbl.text = "Emirates Holidays"
            cell.dateLbl.text = "Wed 10:30 pm"
            cell.seperatorImg.backgroundColor = YellowColor
            cell.dotImg.backgroundColor = YellowColor
        }
        else if indexPath.row == 5 {
            cell.nameLbl.text = "VR Park and Aquarium"
            cell.dateLbl.text = "Tue 11:00 pm"
            cell.seperatorImg.backgroundColor = PinkColor
            cell.dotImg.backgroundColor = PinkColor
        }
        else if indexPath.row == 6 {
            cell.nameLbl.text = "Hotels + Resorts"
            cell.dateLbl.text = "Tue 12:30 pm"
            cell.seperatorImg.backgroundColor = YellowColor
            cell.dotImg.backgroundColor = YellowColor
        }else {
            cell.nameLbl.text = ""
            cell.dateLbl.text = ""
            cell.profilePicImg.isHidden = true
            cell.dotImg.isHidden = true
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
