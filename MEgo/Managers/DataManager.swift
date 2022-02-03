//
//  DataManager.swift
//  MEgo
//
//  Created by Marlon Henry on 9/12/21.
//

import Foundation

class DataManager {
    static let sharedInstance = DataManager()
    private let defaults = UserDefaults.standard
    private let activityStatusString = "activityStatus"
    var activityStatus: Bool {
        get {
            let status = getUserStatus()
            
            return status
        }
    }
    
    func logIn(){
        defaults.set(true, forKey: activityStatusString)
    }
    
    func logOut(){
        defaults.set(false, forKey: activityStatusString)
    }
    
    private func getUserStatus()->Bool{
        let status = defaults.bool(forKey: activityStatusString)
        return status
    }
}
