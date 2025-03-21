//
//  Category.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//


enum Category: String, Codable, CaseIterable, Identifiable, Sendable {
    case `Any`, Programming, Misc, Dark, Pun, Spooky, Christmas
    public var id: Self { self }
    
    var emoji: String {
        switch self {
            case .Any: ""
        case .Programming: "🤖"
        case .Misc: "🎉"
        case .Dark: "🌓"
        case .Pun: "😈"
        case .Spooky: "👻"
        case .Christmas: "🎄"
        }
    }
}
