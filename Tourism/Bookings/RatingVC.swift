//
//  RatingVC.swift
//  Tourism
//
//  Created by Keyur on 26/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class RatingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rateCV: UICollectionView!
    @IBOutlet weak var nextVisitLbl: Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rateCV.register(UINib.init(nibName: "CustomRatingCVC", bundle: nil), forCellWithReuseIdentifier: "CustomRatingCVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToView(_ sender: Any) {
        
    }
    
    //MARK:- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN.WIDTH, height: collectionView.frame.size.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomRatingCVC = rateCV.dequeueReusableCell(withReuseIdentifier: "CustomRatingCVC", for: indexPath) as! CustomRatingCVC
        
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
