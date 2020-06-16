//
//  AppModel.swift
//  Cozy Up
//
//  Created by Amisha on 15/10/18.
//  Copyright © 2018 Amisha. All rights reserved.
//
import UIKit


class AppModel: NSObject {
    static let shared = AppModel()
    var currentUser : UserModel!
    
    func resetAllModel()
    {
        currentUser = UserModel.init()
    }
}
class UserModel : AppModel
{
    var userid : String!
    var profile_pic : String!
    
    override init(){
        userid = ""
        profile_pic = ""
    }
    
    init(dict : [String : Any])
    {
        userid = ""
        profile_pic = ""
        
        if let temp = dict["userid"] as? String {
            userid = temp
        }
        if let temp = dict["profile_pic"] as? String {
            profile_pic = temp
        }
    }
    
    func dictionary() -> [String:Any]  {
        return ["userid":userid!, "profile_pic":profile_pic!]
    }
}

class ExtraFoodModel : AppModel
{
    var name : String!
    var price : Float!
    var isAdd : Bool!
    
    override init(){
        name = ""
        price = 0
        isAdd = false
    }
    
    init(dict : [String : Any])
    {
        name = ""
        price = 0
        isAdd = false
        
        if let temp = dict["name"] as? String {
            name = temp
        }
        if let temp = dict["price"] as? Float {
            price = temp
        }
        if let temp = dict["isAdd"] as? Bool {
            isAdd = temp
        }
    }
    
    func dictionary() -> [String:Any]  {
        return ["name":name!, "price":price!, "isAdd":isAdd!]
    }
}
