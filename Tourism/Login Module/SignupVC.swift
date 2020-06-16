//
//  SignupVC.swift
//  Tourism
//
//  Created by PC on 21/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var nameTxt: FloatingTextfiledView!
    @IBOutlet weak var emailTxt: FloatingTextfiledView!
    @IBOutlet weak var dobTxt: FloatingTextfiledView!
    @IBOutlet weak var telephoneTxt: FloatingTextfiledView!
    @IBOutlet weak var countryTxt: FloatingTextfiledView!
    @IBOutlet weak var nationalityTxt: FloatingTextfiledView!
    @IBOutlet weak var passwordTxt: FloatingTextfiledView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUIDesigning()
    }
    
    func setUIDesigning() {
        emailTxt.myTxt.keyboardType = .emailAddress
        telephoneTxt.myTxt.keyboardType = .phonePad
        passwordTxt.myTxt.isSecureTextEntry = true
    }
    
    //MARK:- Button click event
    @IBAction func clickToSelectDOB(_ sender: UIButton) {
        self.view.endEditing(true)
    }
    
    @IBAction func clickToClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToSignup(_ sender: Any) {
    
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
