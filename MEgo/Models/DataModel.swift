//
//  DataModel.swift
//  MEgo
//
//  Created by Marlon Henry on 9/12/21.
//

import Foundation

struct User:Codable {
    var name:String
    var password:String
    var userName:String
}

struct Message:Codable {
    var messageBody:String
    var messageFrom:String
    var messageTo:String
}

struct TestOb:Codable {
    var userId: Int
    var id:Int
    var title:String
    var completed:Bool
    
}

//Constants:
struct ApiStrings {
    static let baseUrl = ""
    static let pingableURL = "http://google.com"
    static let testUrl = "https://jsonplaceholder.typicode.com/todos/1"
}

struct Routes {
    static let user = "user"
}

enum ResponseStatus {
    case success
    case failure
}

//Card Status ex:

enum CardWorkStatus{
    case notStarted
    case inProgress
    case completed
}

enum CardStatusRatio{
    case zero
    case ten
    case twenty
    case fifty
    case hundered
    
}

struct Card {
    let status:CardWorkStatus
    let progressStatus:CardStatusRatio
}


public struct FeedItem
{
    public enum Style: CaseIterable {
        case bigTop
        case river
        case ad
        case houseAd
        case slideshow
    }
    
    public let style: Style
    public let title: String
    public let headline: String
    public let image: String?
}

public class MockClient {
    public func getFeed() -> [FeedItem] {
        return buildFeed()
    }
    
    private func buildFeed() -> [FeedItem] {
        var items = [FeedItem]()
        FeedItem.Style.allCases.forEach {
            let max = Int.random(in: 1 ... 10)
            for i in 0..<max {
                let item = FeedItem(style: $0, title: "Headline number \(i+1)", headline: "Style \($0)", image: nil)
                items.append(item)
            }
        }
        return items
    }
}

