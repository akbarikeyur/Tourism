//
//  ActivityDetailVC.swift
//  Tourism
//
//  Created by Keyur on 27/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomJoinCVC : UICollectionViewCell {
    @IBOutlet weak var outerView: View!
    @IBOutlet weak var joinBtn: Button!
}

class ActivityDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var joinCV: UICollectionView!
    @IBOutlet weak var totalPeopleLbl: Label!
    @IBOutlet weak var rateLbl: Label!
    @IBOutlet weak var bookmarkLbl: Label!
    @IBOutlet weak var totalPhotoLbl: Label!
    @IBOutlet weak var mainImgBtn: Button!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var dateTimeLbl: Label!
    @IBOutlet weak var imgBtn1: Button!
    @IBOutlet weak var imgBtn2: Button!
    @IBOutlet weak var imgBtn3: Button!
    @IBOutlet weak var imgBtn4: Button!
    @IBOutlet weak var imgBtn5: Button!
    @IBOutlet weak var imgBtn6: Button!
    @IBOutlet weak var imgBtn7: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - CollectionView method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomJoinCVC = joinCV.dequeueReusableCell(withReuseIdentifier: "CustomJoinCVC", for: indexPath) as! CustomJoinCVC
        if indexPath.row == 0 {
            cell.outerView.backgroundColor = YellowColor
            cell.joinBtn.setBackgroundImage(nil, for: .normal)
            cell.joinBtn.backgroundColor = YellowColor
            cell.joinBtn.setTitle("Join +", for: .normal)
            cell.outerView.layer.borderColor = ClearColor.cgColor
        }
        else{
            cell.outerView.backgroundColor = ClearColor
            cell.outerView.layer.borderColor = PinkColor.cgColor
            cell.outerView.layer.borderWidth = 1
            cell.joinBtn.backgroundColor = ClearColor
            cell.joinBtn.setBackgroundImage(UIImage.init(named: "profile_user"), for: .normal)
            cell.joinBtn.setTitle("", for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc : JoinActivityVC = STORYBOARD.BOOKING.instantiateViewController(withIdentifier: "JoinActivityVC") as! JoinActivityVC
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
