//
//  Colors.swift
//  Cozy Up
//
//  Created by Amisha on 15/10/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

var ClearColor : UIColor = UIColor.clear //0
var WhiteColor : UIColor = UIColor.white //1
var DarkGrayColor : UIColor = colorFromHex(hex: "222222") //2
var LightGrayColor : UIColor = colorFromHex(hex: "606271") //3
var ExtraLightGrayColor : UIColor = colorFromHex(hex: "B2B0B0") //4
var BlackColor : UIColor = UIColor.black   //5
var YellowColor : UIColor = colorFromHex(hex: "FFD93F")//6
var BGColor : UIColor = colorFromHex(hex: "F2F2FA")//7
var PinkColor : UIColor = colorFromHex(hex: "FE7584")//8
var PurpleColor : UIColor = colorFromHex(hex: "8150DB")//9
var BlueColor : UIColor = colorFromHex(hex: "0031FF")//10
var GreenColor : UIColor = colorFromHex(hex: "91CB6A")//11
var LightDroDownBGColor : UIColor = colorFromHex(hex: "F2F3F4") //12

enum ColorType : Int32 {
    case Clear = 0
    case White = 1
    case DarkGray = 2
    case LightGray = 3
    case ExtraLightGray = 4
    case Black = 5
    case Yellow = 6
    case BG = 7
    case Pink = 8
    case Purple = 9
    case Blue = 10
    case Green = 11
    case LightDroDownBG = 12
}

extension ColorType {
    var value: UIColor {
        get {
            switch self {
            case .Clear: //0
                return ClearColor
            case .White: //1
                return WhiteColor
            case .DarkGray: //2
                return DarkGrayColor
            case .LightGray: //3
                return LightGrayColor
            case .ExtraLightGray: //4
                return ExtraLightGrayColor
            case .Black: //5
                return BlackColor
            case .Yellow: //6
                return YellowColor
            case .BG: //7
                return BGColor
            case .Pink: //8
                return PinkColor
            case .Purple: //9
                return PurpleColor
            case .Blue: //10
                return BlueColor
            case .Green: //11
                return GreenColor
            case .LightDroDownBG: //12
                return LightDroDownBGColor
            }
        }
    }
}

enum GradientColorType : Int32 {
    case Clear = 0
    case App = 1
}

extension GradientColorType {
    var layer : GradientLayer {
        get {
            let gradient = GradientLayer()
            switch self {
            case .Clear: //0
                gradient.frame = CGRect.zero
            case .App: //1
                gradient.colors = [
                    WhiteColor.cgColor,
                    BlackColor.cgColor
                ]
                gradient.locations = [0, 1]
                gradient.startPoint = CGPoint.zero
                gradient.endPoint = CGPoint(x: 1, y: 0)
            }
            
            return gradient
        }
    }
}


enum GradientColorTypeForView : Int32 {
    case Clear = 0
    case App = 1
}


extension GradientColorTypeForView {
    var layer : GradientLayer {
        get {
            let gradient = GradientLayer()
            switch self {
            case .Clear: //0
                gradient.frame = CGRect.zero
            case .App: //1
                gradient.colors = [
                    WhiteColor.cgColor,
                    BlackColor.cgColor
                ]
                gradient.locations = [0, 1]
                gradient.startPoint = CGPoint(x: 0.8, y: 1.0)
                gradient.endPoint = CGPoint(x: 0.8, y: 0.0)

            }
            
            return gradient
        }
    }
}

