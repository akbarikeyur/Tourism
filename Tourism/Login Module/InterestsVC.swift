//
//  InterestsVC.swift
//  Tourism
//
//  Created by PC on 21/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class InterestsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var activityCV: UICollectionView!
    
    var arrInterestName = ["Sports", "Eating", "Park", "Rides", "Clubs", "Traveling", "Swimming", "Exercise", "Golf"]
    var arrInterestImage = ["ic_sport", "ic_eating", "ic_park", "ic_ride", "ic_club", "ic_travel", "ic_swimming", "ic_exercise", "ic_golf"]
    var arrSelected = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityCV.register(UINib.init(nibName: "CustomActivityCVC", bundle: nil), forCellWithReuseIdentifier: "CustomActivityCVC")
    }
    //MARK:- Button click event
    @IBAction func clickToMore(_ sender: Any) {
        
    }
    
    @IBAction func clickToSaveActivity(_ sender: Any) {
        AppDelegate().sharedDelegate().navigateToDashBoard()
    }
    
    @IBAction func clickToClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomActivityCVC = activityCV.dequeueReusableCell(withReuseIdentifier: "CustomActivityCVC", for: indexPath) as! CustomActivityCVC
        cell.imgBtn.setImage(UIImage.init(named: arrInterestImage[indexPath.row]), for: .normal)
        cell.titleLbl.text = arrInterestName[indexPath.row]
        cell.selectBtn.isHidden = !arrSelected.contains(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = arrSelected.firstIndex { (temp) -> Bool in
            temp == indexPath.row
        }
        if index == nil {
            arrSelected.append(indexPath.row)
        }else{
            arrSelected.remove(at: index!)
        }
        activityCV.reloadData()
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
