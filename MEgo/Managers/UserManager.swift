//
//  UserManager.swift
//  MEgo
//
//  Created by Marlon Henry on 9/11/21.
//

import Foundation
import UIKit

class UserManager {
    static let sharedInstance = UserManager()
    let dataManager = DataManager.sharedInstance
    var userStatus = Bool()
    let security = SecurityManager.sharedInstance
    let userID = UIDevice.current.identifierForVendor?.uuidString
    
    
    //return user login status
    
    
    //Functions:
    func isLoggedin()->Bool{
        userStatus = dataManager.activityStatus
        return userStatus
    }
    
    func createNewUser(){
        
        
    }
    
    func logIn(){
        security.checkPermissions(userID: userID)
        dataManager.logIn()
    }
    
    func logOut(){
        dataManager.logOut()
        
    }
}
