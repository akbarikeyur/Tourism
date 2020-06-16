//
//  HotelListVC.swift
//  Tourism
//
//  Created by Keyur on 05/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class HotelListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemCV: UICollectionView!
    @IBOutlet weak var itemTblView: UITableView!
    @IBOutlet weak var constraintHeightTblView: NSLayoutConstraint!
    @IBOutlet weak var itemLbl: Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemCV.register(UINib.init(nibName: "CustomFoodCVC", bundle: nil), forCellWithReuseIdentifier: "CustomFoodCVC")
        itemTblView.register(UINib.init(nibName: "CustomDealTVC", bundle: nil), forCellReuseIdentifier: "CustomDealTVC")
        
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomFoodCVC = itemCV.dequeueReusableCell(withReuseIdentifier: "CustomFoodCVC", for: indexPath) as! CustomFoodCVC
        cell.subTitleLbl.text = ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc : HotelDetailsVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomDealTVC = itemTblView.dequeueReusableCell(withIdentifier: "CustomDealTVC") as! CustomDealTVC
        constraintHeightTblView.constant = itemTblView.contentSize.height
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc : HotelDetailsVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
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
