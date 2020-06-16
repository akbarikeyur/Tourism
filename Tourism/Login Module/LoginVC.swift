//
//  LoginVC.swift
//  Tourism
//
//  Created by PC on 20/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: FloatingTextfiledView!
    @IBOutlet weak var passwordTxt: FloatingTextfiledView!
    @IBOutlet weak var signupLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUIDesigning()
    }
    
    func setUIDesigning() {
        emailTxt.myTxt.keyboardType = .emailAddress
        passwordTxt.myTxt.isSecureTextEntry = true
        
        signupLbl.attributedText = attributedStringWithColor(signupLbl.text!, ["Sign up"], color: BlackColor, font: UIFont.init(name: APP_REGULAR, size: 16))
    }
    
    //MARK:- Button click event
    @IBAction func clickToClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToSkip(_ sender: Any) {
        AppDelegate().sharedDelegate().navigateToDashBoard()
    }
    
    @IBAction func clickToSignup(_ sender: Any) {
        let vc : SignupVC = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickToSignin(_ sender: Any) {
        let vc : LocationPermissionVC = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "LocationPermissionVC") as! LocationPermissionVC
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
