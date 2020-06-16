//
//  MyLocationVC.swift
//  Tourism
//
//  Created by Amisha on 22/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit
import DropDown

class CustomPhotoVideoCVC: UICollectionViewCell {
    @IBOutlet weak var imgView: ImageView!
    @IBOutlet weak var videoBtn: UIButton!
}

class CustomFollowingCVC: UICollectionViewCell {
    @IBOutlet weak var userBtn: Button!
}

class MyLocationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var photoVideoCV: UICollectionView!
    @IBOutlet weak var followingCV: UICollectionView!
    @IBOutlet weak var nearByCV: UICollectionView!
    @IBOutlet weak var categoryLbl: Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nearByCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        
    }
    
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    //MARK: - Collectionview methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == photoVideoCV {
            return 5
        }
        else if collectionView == followingCV {
            return 10
        }
        else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == photoVideoCV {
            return CGSize(width: 110, height: 150)
        }
        else if collectionView == followingCV {
            return CGSize(width: 70, height: 70)
        }
        else {
            return CGSize(width: 140, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == photoVideoCV {
            let cell : CustomPhotoVideoCVC = photoVideoCV.dequeueReusableCell(withReuseIdentifier: "CustomPhotoVideoCVC", for: indexPath) as! CustomPhotoVideoCVC
            cell.videoBtn.isHidden = (indexPath.row != 0)
            return cell
        }
        else if collectionView == followingCV {
            let cell : CustomFollowingCVC = followingCV.dequeueReusableCell(withReuseIdentifier: "CustomFollowingCVC", for: indexPath) as! CustomFollowingCVC
            
            return cell
        }
        else
        {
            let cell : CustomFoodCVC = nearByCV.dequeueReusableCell(withReuseIdentifier: "CustomFoodCVC", for: indexPath) as! CustomFoodCVC
            cell.subTitleLbl.text = ""
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == nearByCV {
            let vc : RestaurantsListVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "RestaurantsListVC") as! RestaurantsListVC
            vc.selectedCategory = MENU.RESTAURANTS
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func clickToSelectCategory(_ sender: UIButton) {
        self.view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = sender
        dropDown.dataSource = arrCategory
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.categoryLbl.text = item
        }
        dropDown.show()
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
