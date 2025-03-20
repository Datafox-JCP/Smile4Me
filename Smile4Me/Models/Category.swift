//
//  Category.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//


enum Category: String, Codable, CaseIterable, Identifiable, Sendable {
    case `Any`, Programming, Misc, Dark, Pun, Spooky, Christmas
    public var id: Self { self }
}
