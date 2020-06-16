//
//  TreandingDealVC.swift
//  Tourism
//
//  Created by Keyur on 03/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import FSPagerView

class CustomTypeCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var titleLbl: Label!
}

class TreandingDealVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FSPagerViewDataSource,FSPagerViewDelegate {

    @IBOutlet weak var typeCV: UICollectionView!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var subTitleLbl: Label!
    @IBOutlet weak var relatedItemCV: UICollectionView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var itemPageView: FSPagerView!
    
    var arrImageData = ["mall1", "mall2", "mall3"]
    var arrTypeData = ["IMDb", "8.9"]
    var selectedType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        relatedItemCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        imagePageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        itemPageView.transformer = FSPagerViewTransformer(type: .linear)
        itemPageView.register(UINib.init(nibName: "CustomMoviePosterCVC", bundle: nil), forCellWithReuseIdentifier: "CustomMoviePosterCVC")
        itemPageView.itemSize = CGSize(width: itemPageView.frame.size.width-100, height: itemPageView.frame.size.height + ((SCREEN.HEIGHT > 800) ? 100 : 50))
        itemPageView.decelerationDistance = FSPagerView.automaticDistance
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == typeCV {
            return arrTypeData.count
        }
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == typeCV {
            let newLable : UILabel = UILabel.init()
            newLable.font = UIFont.init(name: APP_REGULAR, size: 14.0)
            newLable.text = arrTypeData[indexPath.row]
            let width = newLable.intrinsicContentSize.width
            return CGSize(width: width + 20, height: collectionView.frame.size.height)
        }
        return CGSize(width: 130, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == typeCV {
            let cell : CustomTypeCVC = typeCV.dequeueReusableCell(withReuseIdentifier: "CustomTypeCVC", for: indexPath) as! CustomTypeCVC
            cell.titleLbl.text = arrTypeData[indexPath.row]
            if selectedType == indexPath.row {
                cell.outerView.borderWidth = 0
            }else{
                cell.outerView.borderWidth = 1
            }
            return cell
        }
        else {
            let cell : CustomFoodCVC = relatedItemCV.dequeueReusableCell(withReuseIdentifier: "CustomFoodCVC", for: indexPath) as! CustomFoodCVC
            cell.imgView.image = UIImage.init(named: "movie_poster")
            cell.titleLbl.text = "Private Screening" + String(indexPath.row+1)
            cell.subTitleLbl.text = ""
            return cell
        }
    }

    @IBAction func clickToPageControl(_ sender: UIPageControl) {
        imagePageControl.currentPage = sender.currentPage
        itemPageView.scrollToItem(at: sender.currentPage, animated: true)
    }
    
    // MARK:- FSPagerViewDataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell : CustomMoviePosterCVC = pagerView.dequeueReusableCell(withReuseIdentifier: "CustomMoviePosterCVC", at: index) as! CustomMoviePosterCVC
        cell.imgView.image = UIImage.init(named: "movie_poster")
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        imagePageControl.currentPage = index
        pagerView.scrollToItem(at: index, animated: true)
        let vc : CinemaDetailVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "CinemaDetailVC") as! CinemaDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        imagePageControl.currentPage = targetIndex
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
