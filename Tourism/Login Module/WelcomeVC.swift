//
//  WelcomeVC.swift
//  Tourism
//
//  Created by Amisha on 20/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var welcomeCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let arrImgData : [String] = ["screen1", "screen2", "screen3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcomeCV.register(UINib.init(nibName: "CustomWelcomeCVC", bundle: nil), forCellWithReuseIdentifier: "CustomWelcomeCVC")
        pageControl.numberOfPages = arrImgData.count
        pageControl.currentPage = 0
        welcomeCV.reloadData()
    }

    //MARK:- Button click event
    @IBAction func clickToSkip(_ sender: Any) {
        let vc : LoginVC = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "LoginVC")as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN.WIDTH + 10, height: SCREEN.HEIGHT+20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomWelcomeCVC = welcomeCV.dequeueReusableCell(withReuseIdentifier: "CustomWelcomeCVC", for: indexPath) as! CustomWelcomeCVC
        cell.imgView.image = UIImage.init(named: arrImgData[indexPath.row])
        if indexPath.row == 0 {
            cell.titleLbl.text = "Explore places"
        }
        else if indexPath.row == 1 {
            cell.titleLbl.text = "Plan your trip"
        }
        else if indexPath.row == 2 {
            cell.titleLbl.text = "Share Location"
        }
        cell.descLbl.text = "This is mary your tour guide in dubai,\nLet's tour together"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.welcomeCV.contentOffset, size: self.welcomeCV.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.welcomeCV.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
}

