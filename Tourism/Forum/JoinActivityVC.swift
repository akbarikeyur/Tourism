//
//  JoinActivityVC.swift
//  Tourism
//
//  Created by Keyur on 28/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class JoinActivityVC: UIViewController {

    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var addressLbl: Label!
    @IBOutlet weak var categoryTitleLbl: Label!
    @IBOutlet weak var categoryValueLbl: Label!
    @IBOutlet weak var destinationTitleLbl: Label!
    @IBOutlet weak var destinationValueLbl: Label!
    @IBOutlet weak var pickTitleLbl: Label!
    @IBOutlet weak var pickValueLbl: Label!
    @IBOutlet weak var dateLbl: Label!
    @IBOutlet weak var valueLbl: Label!
    @IBOutlet weak var adultTxt: TextField!
    @IBOutlet weak var childTxt: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToSelectCategory(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToSelectPickDrop(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToSelectDate(_ sender: Any) {
        
    }
    
    @IBAction func clickToSelectTime(_ sender: Any) {
        
    }
    
    @IBAction func clickToMinus(_ sender: Any) {
        
    }
    
    @IBAction func clickToAdd(_ sender: Any) {
        
    }
    
    @IBAction func clickToJoined(_ sender: Any) {
        
    }
    
    @IBAction func clickToClose(_ sender: Any) {
        
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
