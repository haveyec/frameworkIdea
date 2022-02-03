//
//  NetworkManager.swift
//  MEgo
//
//  Created by Marlon Henry on 9/12/21.
//

import Foundation
protocol NetworkDelegate {
    func updateDependentView()
    func getData()
}

class NetworkManager:NetworkDelegate {
    func updateDependentView() {
        
    }
    
    func getData() {
        
        

    }
    
    //Properties:
    static let sharedInstance = NetworkManager()
    let apiManager = APIManager.sharedInstance
    var networkDel:NetworkDelegate?
    let security = SecurityManager.sharedInstance
    let userManager = UserManager.sharedInstance
    
    //class init
    init() {
        networkDel = self
    }
    
    //Methods:
    
    func grabData(){
        //Go get whatever data we need and return data ob in completition handler
        networkDel?.updateDependentView()
        
    }
    
    func getData(requestEndP:URLRequest,endPointData:(@escaping ([Codable])->())){
        //Go get whatever message/notification we need and return data ob in completition handler
        
        let session = URLSession.shared.dataTask(with: requestEndP) { [self] data, response, err in
            
            guard let data = data, err == nil else{return security.somethingWentWrong()}
            
                let decoder = JSONDecoder()
            
            switch requestEndP.url?.absoluteString{
            case apiManager.messageRequest.url?.absoluteString :
                guard let decoded = try? decoder.decode([Message].self, from: data) else {
                    return
                }
                
                let parsedUserData = decoded.filter { user in
                    user.messageFrom  == userManager.userID || user.messageTo == userManager.userID 
                }
                
                networkDel?.updateDependentView()
                
                endPointData(parsedUserData)
                break
            case apiManager.userRequest.url?.absoluteString :
                guard let decoded = try? decoder.decode([User].self, from: data) else {
                    return
                }
                networkDel?.updateDependentView()
                endPointData(decoded)
                break
            case apiManager.testRequest.url?.absoluteString :
                guard let decoded = try? decoder.decode([TestOb].self, from: data) else {
                    return
                }
                networkDel?.updateDependentView()
                endPointData(decoded)
            default :
                return
            }
            
        }
        session.resume()
    }
    
    
}

