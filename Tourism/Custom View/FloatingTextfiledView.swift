//
//  FloatingTextfiledView.swift
//  BidInCar
//
//  Created by Amisha on 15/10/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

@IBDesignable class FloatingTextfiledView: UIView, UITextFieldDelegate {

    @IBOutlet weak var myLbl: Label!
    @IBOutlet weak var myTxt: TextField!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var leftSpace: NSLayoutConstraint!
    @IBOutlet weak var trailingSpace: NSLayoutConstraint!
    
    static let shared = FloatingTextfiledView()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        xibSetup()
    }
    
    var view: UIView!
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: FloatingTextfiledView.self)
        let nib = UINib(nibName: "FloatingTextfiledView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        let view = loadViewFromNib()
        view.backgroundColor = ClearColor //colorFromHex(hex: "FFFFFF")
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        if myTxt != nil {
            myLbl.isHidden = true
            setTextFieldPlaceholderColor(myTxt, LightGrayColor)
        }
    }
    
    @IBInspectable open var placeholder: String = "" {
        didSet {
            if myTxt != nil {
                myTxt.placeholder = placeholder.decoded
                myLbl.text = placeholder.decoded
            }
        }
    }
    
    @IBInspectable open var textfield_image: String = "" {
        didSet {
            if imgBtn != nil {
                imgBtn.setImage(UIImage.init(named: textfield_image), for: .normal)
            }
        }
    }
    
    //MARK:- Textfield Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        myLbl.isHidden = false
        myTxt.placeholder = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myLbl.isHidden = (textField.text == "")
        myTxt.placeholder = (textField.text == "") ? placeholder : ""
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
