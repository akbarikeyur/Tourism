//
//  RestaurantsListVC.swift
//  Tourism
//
//  Created by Amisha on 22/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class RestaurantsListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var dealCV: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    
    var expandDict : [String : Bool] = [String : Bool]()
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dealCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        tblView.register(UINib.init(nibName: "CustomDealSectionTVC", bundle: nil), forCellReuseIdentifier: "CustomDealSectionTVC")
        tblView.register(UINib.init(nibName: "CustomDealTVC", bundle: nil), forCellReuseIdentifier: "CustomDealTVC")
        
        tblView.tableHeaderView = headerView
        expandDict[String(0)] = true
        tblView.reloadData()
        dealCV.reloadData()
    }
    
    @IBAction func clickToback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Collectionview methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomFoodCVC = dealCV.dequeueReusableCell(withReuseIdentifier: "CustomFoodCVC", for: indexPath) as! CustomFoodCVC
        var strImage = "food"
        var strTitle = selectedCategory
        switch selectedCategory {
            case MENU.RESTAURANTS:
                strImage = "food"
                strTitle = "Halla Al yamama mandi"
                break
            case MENU.HOTEL:
                strImage = "hotel" + String(indexPath.row+1)
                strTitle = "Park Island Hotel"
                break
            case MENU.ADVENTURE:
                strImage = "adventure" + String(indexPath.row+1)
                strTitle = "Dubai Evening Adventure" + String(indexPath.row+1)
                break
            case MENU.SAFARI:
                strImage = "desert" + String(indexPath.row+1)
                strTitle = "Dubai Evening Desert Safari" + String(indexPath.row+1)
                break
            case MENU.ROAD:
                strImage = "desert" + String(indexPath.row+1)
                strTitle = "Dubai Road Trip" + String(indexPath.row+1)
                break
            case MENU.CINEMA:
                strImage = "movie_poster"
                strTitle = "Private Screening" + String(indexPath.row+1)
                break
            case MENU.CLUB:
                strImage = "club" + String(indexPath.row+1)
                strTitle = "Sensation Club" + String(indexPath.row+1)
                break
            default:
                break
        }
        cell.imgView.image = UIImage.init(named: strImage)
        cell.titleLbl.text = strTitle
        cell.subTitleLbl.text = ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCategory == MENU.RESTAURANTS {
            let vc : RestaurantsDetailsVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsDetailsVC") as! RestaurantsDetailsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if selectedCategory == MENU.HOTEL {
                let vc : HotelIndividualVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "HotelIndividualVC") as! HotelIndividualVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.CINEMA {
                let vc : TreandingDealVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "TreandingDealVC") as! TreandingDealVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.SAFARI {
                let vc : DesertDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "DesertDetailVC") as! DesertDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.CLUB {
                let vc : ClubDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "ClubDetailVC") as! ClubDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.ADVENTURE {
                let vc : AdventureDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "AdventureDetailVC") as! AdventureDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    //MARK: - Tableview methods
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedCategory == MENU.RESTAURANTS {
            return 4
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if selectedCategory == MENU.RESTAURANTS {
            if section == 0 {
                return 80
            }
            return 40
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if selectedCategory == MENU.RESTAURANTS {
            let cell : CustomDealSectionTVC = tblView.dequeueReusableCell(withIdentifier: "CustomDealSectionTVC") as! CustomDealSectionTVC
            cell.titleView.isHidden = (section != 0)
            cell.expandbtn.tag = section
            cell.expandbtn.addTarget(self, action: #selector(clickToExpand(_:)), for: .touchUpInside)
            return cell
        }
        return nil
    }
    
    @objc @IBAction func clickToExpand(_ sender: UIButton) {
        if let value = expandDict[String(sender.tag)] {
            expandDict[String(sender.tag)] = !value
        }else{
            expandDict[String(sender.tag)] = true
        }
        tblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedCategory == MENU.RESTAURANTS {
            if let value = expandDict[String(section)], value == true {
                return 3
            }else{
                return 0
            }
        }
        else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomDealTVC = tblView.dequeueReusableCell(withIdentifier: "CustomDealTVC") as! CustomDealTVC
        var strImage = "food"
        var strTitle = selectedCategory
        switch selectedCategory {
            case MENU.RESTAURANTS:
                strImage = "food"
                strTitle = "Halla Al yamama mandi"
                break
            case MENU.HOTEL:
                strImage = "hotel" + String(indexPath.row+1)
                strTitle = "Park Island Hotel"
                break
            case MENU.ADVENTURE:
                strImage = "adventure" + String(indexPath.row+1)
                strTitle = "Dubai Evening Adventure" + String(indexPath.row+1)
                break
            case MENU.SAFARI:
                strImage = "desert" + String(indexPath.row+1)
                strTitle = "Dubai Evening Desert Safari" + String(indexPath.row+1)
                break
            case MENU.ROAD:
                strImage = "desert" + String(indexPath.row+1)
                strTitle = "Dubai Road Trip" + String(indexPath.row+1)
                break
            case MENU.CINEMA:
                strImage = "movie_poster"
                strTitle = "Private Screening" + String(indexPath.row+1)
                break
            case MENU.CLUB:
                strImage = "club" + String(indexPath.row+1)
                strTitle = "Sensation Club" + String(indexPath.row+1)
                break
            default:
                break
        }
        cell.imgView.image = UIImage.init(named: strImage)
        cell.titleLbl.text = strTitle
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCategory == MENU.RESTAURANTS {
            let vc : RestaurantsDetailsVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsDetailsVC") as! RestaurantsDetailsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if selectedCategory == MENU.HOTEL {
                let vc : HotelIndividualVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "HotelIndividualVC") as! HotelIndividualVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.CINEMA {
                let vc : TreandingDealVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "TreandingDealVC") as! TreandingDealVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.SAFARI {
                let vc : DesertDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "DesertDetailVC") as! DesertDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.CLUB {
                let vc : ClubDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "ClubDetailVC") as! ClubDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if selectedCategory == MENU.ADVENTURE {
                let vc : AdventureDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "AdventureDetailVC") as! AdventureDetailVC
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
