//
//  BookingDetailVC.swift
//  Tourism
//
//  Created by Keyur on 23/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomDateCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var dayLbl: Label!
    @IBOutlet weak var dateLbl: Label!
}

class CustomTimeCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var timeLbl: Label!
}

class CustomTotalPeopleCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var peopleLbl: Label!
}

class BookingDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var userProfilePicBtn: Button!
    @IBOutlet weak var placeImgView: ImageView!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var rateBtn: Button!
    @IBOutlet weak var timeBtn: Button!
    @IBOutlet weak var otherImgView: ImageView!
    @IBOutlet weak var facilityDescLbl: Label!
    @IBOutlet weak var dateCV: UICollectionView!
    @IBOutlet weak var timeCV: UICollectionView!
    @IBOutlet weak var peopleCV: UICollectionView!
    
    var arrDate : [[String : Any]] = [[String : Any]]()
    var arrTime : [[String : Any]] = [[String : Any]]()
    var arrPeople : [[String : Any]] = [[String : Any]]()
    var selectedDate = [String : Any]()
    var selectedTime = [String : Any]()
    var selectedPeople = [String : Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUIDesigning()
    }
    
    func setUIDesigning() {
        arrDate = [[String : Any]]()
        arrPeople = [[String : Any]]()
        for i in 0..<10 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date())
            var temp = [String : Any]()
            temp["day"] = getDateStringFromDate(date: date!, format: "EEE")
            temp["date"] = getDateStringFromDate(date: date!, format: "dd")
            arrDate.append(temp)
        }
        dateCV.reloadData()
        
        arrTime = [[String : Any]]()
        arrTime.append(["time" : "09:30 AM"])
        arrTime.append(["time" : "12:30 AM"])
        arrTime.append(["time" : "03:30 PM"])
        arrTime.append(["time" : "08:40 PM"])
        timeCV.reloadData()
        
        for i in 1...15 {
            arrPeople.append(["title" : String(i)])
        }
        peopleCV.reloadData()
    }
    
    //MARK:- Button click event
    @IBAction func clickToback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToSave(_ sender: Any) {
        let vc : RatingVC = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "RatingVC") as! RatingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Collectionview Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dateCV {
            return arrDate.count
        }
        else if collectionView == timeCV {
            return arrTime.count
        }
        else{
            return arrPeople.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dateCV {
            return CGSize(width: 60, height: 50)
        }
        else if collectionView == timeCV {
            return CGSize(width: 80, height: 30)
        }
        else{
            return CGSize(width: 60, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dateCV {
            let cell : CustomDateCVC = dateCV.dequeueReusableCell(withReuseIdentifier: "CustomDateCVC", for: indexPath) as! CustomDateCVC
            let dict = arrDate[indexPath.row]
            cell.dayLbl.text = (dict["day"] as! String)
            cell.dateLbl.text = (dict["date"] as! String)
            if selectedDate["date"] != nil && (selectedDate["date"] as! String) == (dict["date"] as! String) {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.dayLbl.textColor = DarkGrayColor
                cell.dateLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.dayLbl.textColor = ExtraLightGrayColor
                cell.dateLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
        else if collectionView == timeCV {
            let cell : CustomTimeCVC = timeCV.dequeueReusableCell(withReuseIdentifier: "CustomTimeCVC", for: indexPath) as! CustomTimeCVC
            let dict = arrTime[indexPath.row]
            cell.timeLbl.text = (dict["time"] as! String)
            if selectedTime["time"] != nil && (selectedTime["time"] as! String) == (dict["time"] as! String) {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.timeLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.timeLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
        else{
            let cell : CustomTotalPeopleCVC = peopleCV.dequeueReusableCell(withReuseIdentifier: "CustomTotalPeopleCVC", for: indexPath) as! CustomTotalPeopleCVC
            let dict = arrPeople[indexPath.row]
            cell.peopleLbl.text = (dict["title"] as! String)
            if selectedPeople["title"] != nil && (selectedPeople["title"] as! String) == (dict["title"] as! String) {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.peopleLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.peopleLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dateCV {
            selectedDate = arrDate[indexPath.row]
            dateCV.reloadData()
        }
        else if collectionView == timeCV {
            selectedTime = arrTime[indexPath.row]
            timeCV.reloadData()
        }
        else{
            selectedPeople = arrPeople[indexPath.row]
            peopleCV.reloadData()
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
