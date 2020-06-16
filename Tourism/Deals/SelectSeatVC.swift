//
//  SelectSeatVC.swift
//  Tourism
//
//  Created by Keyur on 03/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomSelectSeatsCVC : UICollectionViewCell {
    @IBOutlet weak var seatBtn: Button!
}

class SelectSeatVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var seatsCV: UICollectionView!
    @IBOutlet weak var constraintHeightSeatsCV: NSLayoutConstraint!
    
    var arrBlank = [0,4,8,13,22, 26, 31, 40, 49, 58,67  ]
    var arrSelected = [Int]()
    var arrReserved = [2,3,16,17,18,19,20,24,41,56,57,58,59,50, 60,61,62,63]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        constraintHeightSeatsCV.constant = (35*8)
    }
    
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToBookTicket(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(NOTIFICATION.REDIRECT_MY_BOOKING), object: nil)
    }
    
    //MARK;- Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (9*8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 35, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomSelectSeatsCVC = seatsCV.dequeueReusableCell(withReuseIdentifier: "CustomSelectSeatsCVC", for: indexPath) as! CustomSelectSeatsCVC
        
        if arrBlank.contains(indexPath.row) {
            cell.seatBtn.isHidden = true
        }else{
            cell.seatBtn.isHidden = false
            cell.seatBtn.layer.borderColor = ClearColor.cgColor
            cell.seatBtn.layer.borderWidth = 0
            if arrSelected.contains(indexPath.row) {
                cell.seatBtn.backgroundColor = YellowColor
            }
            else if arrReserved.contains(indexPath.row) {
                cell.seatBtn.backgroundColor = PurpleColor
            }
            else{
                cell.seatBtn.backgroundColor = ClearColor
                cell.seatBtn.layer.borderColor = DarkGrayColor.cgColor
                cell.seatBtn.layer.borderWidth = 2
            }
        }
        cell.seatBtn.isUserInteractionEnabled = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if arrReserved.contains(indexPath.row) {
            return
        }
        else{
            let index = arrSelected.firstIndex { (temp) -> Bool in
                temp == indexPath.row
            }
            if index == nil {
                arrSelected.append(indexPath.row)
            }else{
                arrSelected.remove(at: index!)
            }
            seatsCV.reloadData()
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
