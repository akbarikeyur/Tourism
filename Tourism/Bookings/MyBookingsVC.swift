//
//  MyBookingsVC.swift
//  Tourism
//
//  Created by Keyur on 23/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomOfferCVC : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var subTitleLbl: Label!
}

class CustomBookingCVC : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: Label!
}

class MyBookingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var profilePicBtn: Button!
    @IBOutlet weak var offerCV: UICollectionView!
    @IBOutlet weak var bookingCV: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet var headerView: UIView!
    
    let arrDayData = ["All Booking", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var selectedDay = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: "CustomBookingTVC", bundle: nil), forCellReuseIdentifier: "CustomBookingTVC")
        tblView.tableHeaderView = headerView
        tblView.reloadData()
        selectedDay = arrDayData[0]
        bookingCV.reloadData()
    }
    
    //MARK:- Button click event
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToGift(_ sender: Any) {
        
    }
    
    @IBAction func clickToFilter(_ sender: Any) {
        
    }
    
    //MARK:- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == offerCV {
            return 2
        }else{
            return arrDayData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == offerCV {
            return CGSize(width: collectionView.frame.size.width, height: 120)
        }else{
            return CGSize(width: 70, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == offerCV {
            let cell : CustomOfferCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomOfferCVC", for: indexPath) as! CustomOfferCVC
            
            return cell
        }else{
            let cell : CustomBookingCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomBookingCVC", for: indexPath) as! CustomBookingCVC
            cell.titleLbl.text = arrDayData[indexPath.row]
            if arrDayData[indexPath.row] == selectedDay {
                cell.titleLbl.textColor = DarkGrayColor
                cell.imgView.isHidden = false
            }else{
                cell.titleLbl.textColor = LightGrayColor
                cell.imgView.isHidden = true
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDay = arrDayData[indexPath.row]
        bookingCV.reloadData()
    }
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomBookingTVC = tblView.dequeueReusableCell(withIdentifier: "CustomBookingTVC") as! CustomBookingTVC
        
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action: #selector(clickToEdit(_:)), for: .touchUpInside)
        cell.eyeBtn.tag = indexPath.row
        cell.eyeBtn.addTarget(self, action: #selector(clickToEye(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    
    @objc func clickToEdit(_ sender: UIButton) {
        
    }
    
    @objc func clickToEye(_ sender: UIButton) {
        let vc : BookingDetailVC = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "BookingDetailVC") as! BookingDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
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
