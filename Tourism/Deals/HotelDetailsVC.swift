//
//  HotelDetailsVC.swift
//  Tourism
//
//  Created by Keyur on 01/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class HotelDetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var hotelImgView: ImageView!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var nameLbl: Label!
    @IBOutlet weak var addressLbl: Label!
    @IBOutlet weak var rateBtn: Button!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var featureCV: UICollectionView!
    @IBOutlet weak var imgBtn1: Button!
    @IBOutlet weak var imgBtn2: Button!
    @IBOutlet weak var imgBtn3: Button!
    @IBOutlet weak var imgBtn4: Button!
    @IBOutlet weak var imgBtn5: Button!
    @IBOutlet weak var imgBtn6: Button!
    @IBOutlet weak var imgBtn7: Button!
    
    var arrFeatureData = ["Wifi", "Gym", "Pool", "Restourant", "Parking"]
    var arrFeatureImgData = ["ic_wifi", "ic_gym", "ic_pool", "ic_restorent", "ic_parking"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        featureCV.register(UINib.init(nibName: "CustomFeatureCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFeatureCVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToBookNow(_ sender: Any) {
        let vc : HotelIndividualVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "HotelIndividualVC") as! HotelIndividualVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFeatureImgData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width/5
        return CGSize(width: size, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomFeatureCVC = featureCV.dequeueReusableCell(withReuseIdentifier: "CustomFeatureCVC", for: indexPath) as! CustomFeatureCVC
        cell.titleLbl.text = arrFeatureData[indexPath.row]
        cell.imgBtn.setImage(UIImage.init(named: arrFeatureImgData[indexPath.row]), for: .normal)
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
