//
//  LocationPermissionVC.swift
//  Tourism
//
//  Created by PC on 21/11/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class LocationPermissionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToAllow(_ sender: Any) {
        let vc : InterestsVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "InterestsVC") as! InterestsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickToDisAllow(_ sender: Any) {
        let vc : InterestsVC = STORYBOARD.HOME.instantiateViewController(withIdentifier: "InterestsVC") as! InterestsVC
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
