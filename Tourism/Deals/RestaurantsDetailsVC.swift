//
//  RestaurantsDetailsVC.swift
//  Tourism
//
//  Created by Keyur on 22/11/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class RestaurantsDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var remainingTimeBtn: Button!
    @IBOutlet weak var heartBtn: Button!
    @IBOutlet weak var titleLbl: Label!
    @IBOutlet weak var descLbl: Label!
    @IBOutlet weak var extraTblView: UITableView!
    @IBOutlet weak var constraintHeightExtraTblView: NSLayoutConstraint!
    @IBOutlet weak var dineIntBtn: Button!
    @IBOutlet weak var deliveryBtn: Button!
    @IBOutlet weak var pickupBtn: Button!
    @IBOutlet weak var quantityLbl: Label!
    @IBOutlet weak var priceLbl: Label!
    
    var arrExtraData = [ExtraFoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        extraTblView.register(UINib.init(nibName: "CustomExtraFoodTVC", bundle: nil), forCellReuseIdentifier: "CustomExtraFoodTVC")
        setUIDesigning()
    }
    
    func setUIDesigning()
    {
        addTempData()
        updateQuantity()
    }
    
    func addTempData()
    {
        var extra = ExtraFoodModel.init()
        extra.name = "Tuna"
        extra.price = 35.00
        arrExtraData.append(extra)
        
        extra = ExtraFoodModel.init()
        extra.name = "Salmon"
        extra.price = 20.00
        arrExtraData.append(extra)
        
        extra = ExtraFoodModel.init()
        extra.name = "Wasabi"
        extra.price = 25.00
        arrExtraData.append(extra)
        
        extra = ExtraFoodModel.init()
        extra.name = "Unagi"
        extra.price = 10.00
        arrExtraData.append(extra)
        
        extra = ExtraFoodModel.init()
        extra.name = "Vegetable"
        extra.price = 5.00
        arrExtraData.append(extra)
        
        extra = ExtraFoodModel.init()
        extra.name = "Noodles"
        extra.price = 30.00
        arrExtraData.append(extra)
        extraTblView.reloadData()
        constraintHeightExtraTblView.constant = CGFloat(arrExtraData.count * 40)
    }
    
    //MARK: - Button click event
    @IBAction func clickToSelectOption(_ sender: Button) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToAddOrder(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init(NOTIFICATION.REDIRECT_MY_BOOKING), object: nil)
    }
    
    //MARK: - Tableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrExtraData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomExtraFoodTVC = extraTblView.dequeueReusableCell(withIdentifier: "CustomExtraFoodTVC") as! CustomExtraFoodTVC
        cell.addBtn.isHidden = true
        cell.cancelBtn.isHidden = true
        cell.successBtn.isHidden = true
        let dict = arrExtraData[indexPath.row]
        cell.titleLbl.text = dict.name
        cell.priceLbl.text = "+ " + String(dict.price)
        
        if dict.isAdd {
            cell.cancelBtn.isHidden = false
            cell.successBtn.isHidden = false
        }else{
            cell.addBtn.isHidden = false
        }
        
        cell.addBtn.tag = indexPath.row
        cell.addBtn.addTarget(self, action: #selector(clickToAddExtra(_:)), for: .touchUpInside)
        cell.cancelBtn.tag = indexPath.row
        cell.cancelBtn.addTarget(self, action: #selector(clickToCancelExtra(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func clickToAddExtra(_ sender: UIButton) {
        self.view.endEditing(true)
        arrExtraData[sender.tag].isAdd = true
        extraTblView.reloadData()
        updateQuantity()
    }
    
    @objc func clickToCancelExtra(_ sender: UIButton) {
        self.view.endEditing(true)
        arrExtraData[sender.tag].isAdd = false
        extraTblView.reloadData()
        updateQuantity()
    }
    
    func updateQuantity()
    {
        var total = 0
        for temp in arrExtraData {
            if temp.isAdd {
                total += 1
            }
        }
        if total > 0 {
            quantityLbl.text = "1 Item + " + String(total)
            quantityLbl.attributedText = attributedStringWithColor(quantityLbl.text!, ["+ " + String(total)], color: PinkColor, font: nil)
        }else{
            quantityLbl.text = "1 Item"
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
