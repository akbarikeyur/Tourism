//
//  BookTripVC.swift
//  Tourism
//
//  Created by PC on 21/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit
import DropDown

class BookTripVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var dateLbl: Label!
    @IBOutlet weak var timeLbl: Label!
    @IBOutlet weak var categoryLbl: Label!
    @IBOutlet weak var tripCV: UICollectionView!
    @IBOutlet weak var searchTxt: TextField!
    
    var selectedDate : Date = Date()
    var selectedTime : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tripCV.register(UINib.init(nibName: "CustomTripAreaCVC", bundle: nil), forCellWithReuseIdentifier: "CustomTripAreaCVC")
        setUIDesigning()
    }
    
    func setUIDesigning()
    {
        selectedDate = Date()
        dateLbl.text = getDateStringFromDate(date: selectedDate, format: "EEEE, dd")
        selectedTime = Date()
        timeLbl.text = getDateStringFromDate(date: selectedTime, format: "hh:mm a")
    }
    
    //MARK:- Button click event
    @IBAction func clickToSelectDate(_ sender: UIButton) {
        DatePickerManager.shared.showPicker(title: "Select Date", selected: selectedDate, min: Date(), max: nil) { (date, isCancel) in
            if !isCancel {
                self.selectedDate = date!
                self.dateLbl.text = getDateStringFromDate(date: self.selectedDate, format: "EEEE, dd")
            }
        }
    }
    
    @IBAction func clickToSelectTime(_ sender: UIButton) {
        DatePickerManager.shared.showPickerForTime(title: "Select Time", selected: selectedTime, min: nil, max: nil) { (date, isCancel) in
            if !isCancel {
                self.selectedTime = date!
                self.timeLbl.text = getDateStringFromDate(date: self.selectedTime, format: "hh:mm a")
            }
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
    
    @IBAction func clickToSearch(_ sender: Any) {
        
    }
    
    @IBAction func clickToNotification(_ sender: Any) {
        
    }
    
    @IBAction func clickToSideMenu(_ sender: Any) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func clickToFilter(_ sender: Any) {
        
    }
    
    //MARK:- Collectionview Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomTripAreaCVC = tripCV.dequeueReusableCell(withReuseIdentifier: "CustomTripAreaCVC", for: indexPath) as! CustomTripAreaCVC
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc : MyLocationVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "MyLocationVC") as! MyLocationVC
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
