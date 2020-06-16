//
//  AllDealsVC.swift
//  Tourism
//
//  Created by Keyur on 29/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import FSPagerView

class CustomCategoryCVC : UICollectionViewCell {
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var seperatoryImg: ImageView!
}

class AllDealsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FSPagerViewDataSource,FSPagerViewDelegate {

    @IBOutlet weak var profilePicBtn: Button!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var relatedItemCV: UICollectionView!
    @IBOutlet weak var categoryLbl: Label!
    @IBOutlet weak var itemPageView: FSPagerView!
    
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        relatedItemCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        selectedCategory = arrCategory[0]
        categoryLbl.text = selectedCategory
        
        itemPageView.transformer = FSPagerViewTransformer(type: .overlap)
        itemPageView.register(UINib.init(nibName: "CustomDealCVC", bundle: nil), forCellWithReuseIdentifier: "CustomDealCVC")
        itemPageView.itemSize = CGSize(width: itemPageView.frame.size.width, height: itemPageView.frame.size.height + ((SCREEN.HEIGHT > 800) ? 150 : 100))
        itemPageView.decelerationDistance = FSPagerView.automaticDistance
        
    }
    
    //MARK: - Button click event
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
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
        return 4
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
            let cell : CustomCategoryCVC = categoryCV.dequeueReusableCell(withReuseIdentifier: "CustomCategoryCVC", for: indexPath) as! CustomCategoryCVC
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
        cell.bookNowBtn.isHidden = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
        let vc : AllCategoriesVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
        vc.selectedCategory = selectedCategory
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
