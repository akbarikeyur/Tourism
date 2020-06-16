//
//  AllCategoriesVC.swift
//  Tourism
//
//  Created by Keyur on 05/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import FSPagerView

class CustomAllCategoryCVC : UICollectionViewCell {
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var seperatoryImg: ImageView!
}

class AllCategoriesVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FSPagerViewDataSource,FSPagerViewDelegate {

    @IBOutlet weak var profilePicBtn: Button!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var relatedItemCV: UICollectionView!
    @IBOutlet weak var categoryLbl: Label!
    @IBOutlet weak var itemPageView: FSPagerView!
    
    var arrCategory = [MENU.RESTAURANTS, MENU.HOTEL, MENU.ADVENTURE, MENU.SAFARI, MENU.ROAD, MENU.CINEMA, MENU.CLUB, MENU.TRAVEL, MENU.OTHERS]
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        relatedItemCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        
        if selectedCategory == "" {
            selectedCategory = arrCategory[0]
        }
        for i in 0..<arrCategory.count {
            if selectedCategory == arrCategory[i] {
                selectedCategory = arrCategory[i]
                categoryCV.scrollToItem(at: IndexPath.init(row: i, section: 0), at: UICollectionView.ScrollPosition.right, animated: true)
                break
            }
        }
        categoryLbl.text = selectedCategory
        
        itemPageView.transformer = FSPagerViewTransformer(type: .overlap)
        itemPageView.register(UINib.init(nibName: "CustomDealCVC", bundle: nil), forCellWithReuseIdentifier: "CustomDealCVC")
        itemPageView.itemSize = CGSize(width: itemPageView.frame.size.width, height: itemPageView.frame.size.height + ((SCREEN.HEIGHT > 800) ? 150 : 100))
        itemPageView.decelerationDistance = FSPagerView.automaticDistance
        
    }
    
    //MARK: - Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToUserProfile(_ sender: Any) {
        let vc : PostListVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "PostListVC") as! PostListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickToViewAll(_ sender: Any) {
        let vc : RestaurantsListVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsListVC") as! RestaurantsListVC
        vc.selectedCategory = selectedCategory
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCV {
            return arrCategory.count
        }
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCV {
            let newLable : UILabel = UILabel.init()
            newLable.font = UIFont.init(name: APP_REGULAR, size: 14.0)
            newLable.text = arrCategory[indexPath.row]
            let width = newLable.intrinsicContentSize.width
            return CGSize(width: width + 20, height: collectionView.frame.size.height)
        }
        return CGSize(width: 130, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCV {
            let cell : CustomAllCategoryCVC = categoryCV.dequeueReusableCell(withReuseIdentifier: "CustomAllCategoryCVC", for: indexPath) as! CustomAllCategoryCVC
            cell.titleLbl.text = arrCategory[indexPath.row]
            cell.seperatoryImg.isHidden = (selectedCategory != arrCategory[indexPath.row])
            return cell
        }
        else {
            let cell : CustomFoodCVC = relatedItemCV.dequeueReusableCell(withReuseIdentifier: "CustomFoodCVC", for: indexPath) as! CustomFoodCVC
            var strImage = "food"
            switch selectedCategory {
                case MENU.RESTAURANTS:
                    strImage = "food"
                    break
                case MENU.HOTEL:
                    strImage = "hotel" + String(indexPath.row+1)
                    break
                case MENU.ADVENTURE:
                    strImage = "adventure" + String(indexPath.row+1)
                    break
                case MENU.SAFARI:
                    strImage = "desert" + String(indexPath.row+1)
                    break
                case MENU.ROAD:
                    strImage = "desert" + String(indexPath.row+1)
                    break
                case MENU.CINEMA:
                    strImage = "movie_poster"
                    break
                case MENU.CLUB:
                    strImage = "club" + String(indexPath.row+1)
                    break
                default:
                    break
            }
            cell.imgView.image = UIImage.init(named: strImage)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCV {
            selectedCategory = arrCategory[indexPath.row]
            categoryLbl.text = selectedCategory
            categoryCV.reloadData()
            relatedItemCV.reloadData()
            itemPageView.reloadData()
        }
    }
    
    // MARK:- FSPagerViewDataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 5
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell : CustomDealCVC = pagerView.dequeueReusableCell(withReuseIdentifier: "CustomDealCVC", at: index) as! CustomDealCVC
        var strImage = "food"
        var strTitle = selectedCategory
        var strDesc = selectedCategory + " description display here"
        switch selectedCategory {
            case MENU.RESTAURANTS:
                strImage = "food"
                strTitle = "Halla Al yamama mandi"
                strDesc = "Every sunday at 5* Sheraton Dubai Creek All-you-can-eat experience at Hibachi"
                break
            case MENU.HOTEL:
                strImage = "hotel"
                strTitle = "Park Island Hotel"
                strDesc = "Risk Free: You can cancel later, so lock in this great price today!"
                break
            case MENU.ADVENTURE:
                strImage = "adventure"
                strTitle = "Dubai Evening Adventure"
                strDesc = "Dubai adventure description display here"
                break
            case MENU.SAFARI:
                strImage = "desert_temp"
                strTitle = "Dubai Evening Desert Safari"
                strDesc = "With BBQ Dinner and 7 Live shows 6 Hrs"
                break
            case MENU.ROAD:
                strImage = "desert1"
                strTitle = "Dubai Road Trip"
                strDesc = "Dubai road trip description display here"
                break
            case MENU.CINEMA:
                strImage = "movie_poster"
                strTitle = "Private Screening"
                strDesc = "Bond with family, friends or colleagues with a Private screening at Roxy Cinemas"
                break
            case MENU.CLUB:
                strImage = "club"
                strTitle = "Sensation Club"
                strDesc = "Valid on UAE National Day!\nMeal include burger, fries and softdrink!"
                break
            default:
                break
        }
        cell.imgView.image = UIImage.init(named: strImage)
        cell.titleLbl.text = strTitle
        cell.descLbl.text = strDesc
        cell.bookNowBtn.isHidden = false
        cell.bookNowBtn.addTarget(self, action: #selector(clickToBookNow(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func clickToBookNow(_ sender : Button) {
        redirectToIndividualPage()
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        redirectToIndividualPage()
    }
    
    func redirectToIndividualPage()
    {
        if selectedCategory == MENU.RESTAURANTS {
            let vc : RestaurantsListVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsListVC") as! RestaurantsListVC
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
