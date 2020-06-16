//
//  AdventureDetailVC.swift
//  Tourism
//
//  Created by Keyur on 05/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class AdventureDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var peopleCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        peopleCV.register(UINib.init(nibName: "CustomPeopleCVC", bundle: nil), forCellWithReuseIdentifier: "CustomPeopleCVC")
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomPeopleCVC = peopleCV.dequeueReusableCell(withReuseIdentifier: "CustomPeopleCVC", for: indexPath) as! CustomPeopleCVC
        
        return cell
    }
    
    @IBAction func clickToAddMyTrip(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(NOTIFICATION.REDIRECT_PLAN_TRIP), object: nil)
    }
    
    
    @IBAction func clickToAddOrder(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(NOTIFICATION.REDIRECT_MY_BOOKING), object: nil)
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
