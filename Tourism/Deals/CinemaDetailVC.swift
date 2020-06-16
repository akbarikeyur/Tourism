//
//  CinemaDetailVC.swift
//  Tourism
//
//  Created by Keyur on 04/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CinemaDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var smallPosterImgView: UIImageView!
    @IBOutlet weak var movieTypeLbl: Label!
    @IBOutlet weak var reviewlbl: Label!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var movieNameLbl: Label!
    @IBOutlet weak var movieSubTitleLbl: Label!
    @IBOutlet weak var releaseDatelbl: Label!
    @IBOutlet weak var durationLbl: Label!
    @IBOutlet weak var directorLbl: Label!
    @IBOutlet weak var writerLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var otherPeopleLbl: Label!
    @IBOutlet weak var peopleCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        peopleCV.register(UINib.init(nibName: "CustomPeopleCVC", bundle: nil), forCellWithReuseIdentifier: "CustomPeopleCVC")
    }
    
    // MARK: - Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToViewTrailer(_ sender: Any) {
        
    }
    
    @IBAction func clickToBookTicket(_ sender: Any) {
        let vc : TicketBookingVC = STORYBOARD.DEALS.instantiateViewController(withIdentifier: "TicketBookingVC") as! TicketBookingVC
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
