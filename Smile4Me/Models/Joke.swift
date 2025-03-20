//
//  Joke.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import Foundation

struct Joke: Codable, Sendable {
    public let id: Int
    public let category: Category
    public let type: JokeType
    public let lang: Language
    public let setup: String?
    public let delivery: String?
    public let joke: String?
}
