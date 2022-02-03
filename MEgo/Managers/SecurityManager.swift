//
//  SecurityManager.swift
//  MEgo
//
//  Created by Marlon Henry on 9/26/21.
//

import Foundation
import UIKit

class SecurityManager {
    static let sharedInstance = SecurityManager()
    
    func checkPermissions(userID:String?){
        guard let deviceID = userID else {
            return
        }
        print(deviceID)
    }
    
    func somethingWentWrong(){
        
    }
}
