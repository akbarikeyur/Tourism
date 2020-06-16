//
//  TicketBookingVC.swift
//  Tourism
//
//  Created by Keyur on 03/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomTotalTickerCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var ticketLbl: Label!
    @IBOutlet weak var countLbl: Label!
}

class CustomTicketDateCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var dayLbl: Label!
    @IBOutlet weak var dateLbl: Label!
}

class CustomTicketTimeCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var timeLbl: Label!
}

class CustomMovieVanueCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var vanueBtn: Button!
}

class TicketBookingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profilePicImg: ImageView!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var subTitleLbl: Label!
    @IBOutlet weak var typeLbl: Label!
    @IBOutlet weak var rateLbl: Label!
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var ticketCV: UICollectionView!
    @IBOutlet weak var dateCV: UICollectionView!
    @IBOutlet weak var timeCV: UICollectionView!
    @IBOutlet weak var vanueCV: UICollectionView!
    @IBOutlet weak var snakeTblView: UITableView!
    @IBOutlet weak var constraintHeightSnakeTblView: NSLayoutConstraint!
    @IBOutlet weak var movieNameLbl: Label!
    @IBOutlet weak var screenNameLbl: Label!
    @IBOutlet weak var showTimeLbl: Label!
    @IBOutlet weak var cinemaTblView: UITableView!
    @IBOutlet weak var constraintHeightCinemaTblView: NSLayoutConstraint!
    @IBOutlet weak var accessoriesLbl: Label!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var otherPeopleLbl: Label!
    @IBOutlet weak var peopleCV: UICollectionView!
    
    var arrDate = [[String : Any]]()
    var arrTime = [[String : Any]]()
    var arrVanue = [[String : Any]]()
    var selectedTicketIndex = 0
    var selectedDateIndex = 0
    var selectedTimeIndex = 0
    var sectionExpandDict = [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        snakeTblView.register(UINib.init(nibName: "CustomSnakeSectionTVC", bundle: nil), forCellReuseIdentifier: "CustomSnakeSectionTVC")
        snakeTblView.register(UINib.init(nibName: "CustomSnakeTVC", bundle: nil), forCellReuseIdentifier: "CustomSnakeTVC")
        cinemaTblView.register(UINib.init(nibName: "CustomMovieDetailTVC", bundle: nil), forCellReuseIdentifier: "CustomMovieDetailTVC")
        peopleCV.register(UINib.init(nibName: "CustomPeopleCVC", bundle: nil), forCellWithReuseIdentifier: "CustomPeopleCVC")
        
        setUIDesigning()
    }
    
    func setUIDesigning()
    {
        arrDate = [[String : Any]]()
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
        
        arrVanue = [[String : Any]]()
        arrVanue.append(["image" : "venue_2d"])
        arrVanue.append(["image" : "venue_3d"])
        arrVanue.append(["image" : "venue_max3d"])
        arrVanue.append(["image" : "venue_mx4d"])
        vanueCV.reloadData()
        
        snakeTblView.reloadData()
        cinemaTblView.reloadData()
        constraintHeightCinemaTblView.constant = 55*4
        
        otherPeopleLbl.attributedText = attributedStringWithColor(otherPeopleLbl.text!, ["(4 Friends)"], color: BlueColor)
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToBookTicket(_ sender: Any) {
        let vc : SelectSeatVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "SelectSeatVC") as! SelectSeatVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ticketCV {
            return 10
        }
        else if collectionView == dateCV {
            return arrDate.count
        }
        else if collectionView == timeCV {
            return arrTime.count
        }
        else if collectionView == vanueCV {
            return arrVanue.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == timeCV {
            return CGSize(width: 80, height: collectionView.frame.size.height)
        }
        return CGSize(width: collectionView.frame.size.height+10, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ticketCV {
            let cell : CustomTotalTickerCVC = ticketCV.dequeueReusableCell(withReuseIdentifier: "CustomTotalTickerCVC", for: indexPath) as! CustomTotalTickerCVC
            cell.countLbl.text = String(indexPath.row + 1)
            if selectedTicketIndex == indexPath.row {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.ticketLbl.textColor = DarkGrayColor
                cell.countLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.ticketLbl.textColor = ExtraLightGrayColor
                cell.countLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
        else if collectionView == dateCV {
            let cell : CustomTicketDateCVC = dateCV.dequeueReusableCell(withReuseIdentifier: "CustomTicketDateCVC", for: indexPath) as! CustomTicketDateCVC
            cell.dateLbl.text = arrDate[indexPath.row]["date"] as? String ?? ""
            cell.dayLbl.text = arrDate[indexPath.row]["day"] as? String ?? ""
            if selectedDateIndex == indexPath.row {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.dateLbl.textColor = DarkGrayColor
                cell.dayLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.dateLbl.textColor = ExtraLightGrayColor
                cell.dayLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
        else if collectionView == timeCV {
            let cell : CustomTicketTimeCVC = timeCV.dequeueReusableCell(withReuseIdentifier: "CustomTicketTimeCVC", for: indexPath) as! CustomTicketTimeCVC
            cell.timeLbl.text = arrTime[indexPath.row]["time"] as? String ?? ""
            if selectedTimeIndex == indexPath.row {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.timeLbl.textColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.timeLbl.textColor = ExtraLightGrayColor
            }
            return cell
        }
        else if collectionView == vanueCV {
            let cell : CustomMovieVanueCVC = vanueCV.dequeueReusableCell(withReuseIdentifier: "CustomMovieVanueCVC", for: indexPath) as! CustomMovieVanueCVC
            cell.vanueBtn.setImage(UIImage.init(named: arrVanue[indexPath.row]["image"] as? String ?? ""), for: .normal)
            if selectedTimeIndex == indexPath.row {
                cell.outerView.layer.borderColor = YellowColor.cgColor
                cell.vanueBtn.tintColor = DarkGrayColor
            }else{
                cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
                cell.vanueBtn.tintColor = ExtraLightGrayColor
            }
            return cell
        }
        else {
            let cell : CustomPeopleCVC = peopleCV.dequeueReusableCell(withReuseIdentifier: "CustomPeopleCVC", for: indexPath) as! CustomPeopleCVC
            
            return cell
        }
    }
    
    //MARK:- Tableview Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == snakeTblView {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == snakeTblView {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell : CustomSnakeSectionTVC = snakeTblView.dequeueReusableCell(withIdentifier: "CustomSnakeSectionTVC") as! CustomSnakeSectionTVC
        if section == 0 {
            cell.titleLbl.text = "Snacks (23)"
            cell.titleLbl.attributedText = attributedStringWithColor(cell.titleLbl.text!, ["(23)"], color: PinkColor)
        }else if section == 1 {
            cell.titleLbl.text = "Drink (07)"
            cell.titleLbl.attributedText = attributedStringWithColor(cell.titleLbl.text!, ["(07)"], color: PinkColor)
        }else if section == 2 {
            cell.titleLbl.text = "Coffee (21)"
            cell.titleLbl.attributedText = attributedStringWithColor(cell.titleLbl.text!, ["(21)"], color: PinkColor)
        }
        
        if let value = sectionExpandDict[String(section)], value == true {
            cell.addBtn.backgroundColor = YellowColor
            cell.addBtn.setTitle("-", for: .normal)
        }else{
            cell.addBtn.backgroundColor = PurpleColor
            cell.addBtn.setTitle("+", for: .normal)
        }
        cell.addBtn.tag = section
        cell.addBtn.addTarget(self, action: #selector(clickToExpand(_:)), for: .touchUpInside)
        constraintHeightSnakeTblView.constant = snakeTblView.contentSize.height
        return cell
    }
    
    @objc func clickToExpand(_ sender : UIButton)
    {
        if let value = sectionExpandDict[String(sender.tag)], value == true {
            sectionExpandDict[String(sender.tag)] = false
        }else{
            sectionExpandDict[String(sender.tag)] = true
        }
        snakeTblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == snakeTblView {
            if let value = sectionExpandDict[String(section)], value == true {
                return 1
            }
            return 0
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == snakeTblView {
            if let value = sectionExpandDict[String(indexPath.section)], value == true {
                return 170
            }
            return 0
        }
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == snakeTblView {
            let cell : CustomSnakeTVC = snakeTblView.dequeueReusableCell(withIdentifier: "CustomSnakeTVC") as! CustomSnakeTVC
            constraintHeightSnakeTblView.constant = snakeTblView.contentSize.height
            return cell
        }else{
            let cell : CustomMovieDetailTVC = cinemaTblView.dequeueReusableCell(withIdentifier: "CustomMovieDetailTVC") as! CustomMovieDetailTVC
            cell.namebtn.setImage(nil, for: .normal)
            cell.namebtn.setTitle("", for: .normal)
            cell.topseperatorImg.isHidden = true
            if indexPath.row == 0 {
                cell.topseperatorImg.isHidden = false
                cell.categoryLbl.text = "Movie"
                cell.namebtn.setTitle("Johnny English Reborn", for: .normal)
                cell.subTitleLbl.text = "AED 20.76"
            }else if indexPath.row == 1 {
                cell.categoryLbl.text = "Tickets"
                cell.namebtn.setTitle("3 Tickets", for: .normal)
                cell.subTitleLbl.text = "x3  -  AED 62.08"
            }else if indexPath.row == 2 {
                cell.categoryLbl.text = "Venue"
                cell.namebtn.setImage(UIImage.init(named: "venue_mx4d"), for: .normal)
                cell.subTitleLbl.text = "AED 05.65"
            }else if indexPath.row == 3 {
                cell.categoryLbl.text = "Snacks"
                cell.namebtn.setTitle("Popcorn", for: .normal)
                cell.subTitleLbl.text = "AED 10"
            }
            return cell
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
