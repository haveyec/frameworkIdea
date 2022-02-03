//
//  SystemManager.swift
//  MEgo
//
//  Created by Marlon Henry on 10/1/21.
//

import Foundation
import UIKit

protocol SecurityDelegate {
    func getUserUserStatus()->Bool
    func loginUser()
    func logOutUser()
}

typealias ActionType = (AnyObject) -> ()
typealias NotificationObject = (AnyObject,Selector)

class SystemManager:SecurityDelegate{
    var apiManager = APIManager.sharedInstance
    var networkManager = NetworkManager.sharedInstance
    var userManager = UserManager.sharedInstance
    static let sharedInstance = SystemManager()
    var titleLBL: UILabel!
    var notify:NotificationObject!
    
    func targetSetup(targetObject:AnyObject,selectorAction: Selector) {
        // We need to do a switch on the selector action to see what function will be passed to selector
        let action = selectorAction
        targetObject.addTarget(self, action: action, for: .touchDown)
    }
    
    @objc func testingOut(){
        
    }
    
    func createNewUser(){
        //Create User and -> success or fail response in completition handler
        userManager.createNewUser()
        
    }
    
    //TODO: - Add support for multiple notifications
    //MARK: this is almost done, just need to figure out how to modify each internal property of the NotificationObject before we pass the array to this function
    
    func setupNotifications(notifications:[NotificationObject]){
        notify?.0 = titleLBL
        notify?.1 = #selector(testingOut)
        notifications.forEach { notification in
            let action = notification.1
            notification.0.addTarget(self, action: action, for: .touchDown)
            
        }
        
    }
    
    func updateDependentView() {
        
    }
    
    func getData() {
        networkManager.getData()
        
    }
    
    func loginUser(){
        userManager.logIn()
    }

    func logOutUser(){
        userManager.logOut()
    }

    func getUserUserStatus()->Bool{
        return userManager.isLoggedin()
    }
    
    func getTestData()-> [Codable]{
        var codeableType = [Codable]()
        networkManager.getData(requestEndP: apiManager.testRequest) { ReturnCodeableOb in
            //assign literal codable object to Return codable ob in here so we can return it to the overall function
            codeableType = ReturnCodeableOb
        }
        return codeableType
    }
    
    
}
