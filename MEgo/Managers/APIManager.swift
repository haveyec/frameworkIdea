//
//  APIManager.swift
//  MEgo
//
//  Created by Marlon Henry on 9/18/21.
//

import Foundation

class APIManager {
    static let sharedInstance = APIManager()
    let baseUrl = ApiStrings.baseUrl
    static let pingableURL = URL(string: ApiStrings.pingableURL)!
    var messageRequest: URLRequest {
        
        guard let requestURL = URL(string: baseUrl) else{return URLRequest(url: APIManager.pingableURL)}
        let request = URLRequest(url: requestURL)
        return request
    }
    
    var userRequest: URLRequest {
        
        guard let requestURL = URL(string: baseUrl) else{return URLRequest(url: APIManager.pingableURL)}
        let request = URLRequest(url: requestURL)
        return request
    }
    
    var testRequest: URLRequest {
        
        guard let requestURL = URL(string: ApiStrings.testUrl) else{return URLRequest(url: APIManager.pingableURL)}
        let request = URLRequest(url: requestURL)
        return request
    }
}
