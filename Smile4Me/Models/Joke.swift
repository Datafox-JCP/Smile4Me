//
//  Joke.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import Foundation

struct Joke: Codable, Equatable {
    let id: Int
    let category: Category
    let type: JokeType
    let lang: Language
    let setup: String?
    let delivery: String?
    let joke: String?
    
    var fullJoke: String {
        switch type {
        case .single:
           joke ?? ""
        case .twopart:
            (setup ?? "") + "\n\n" + (delivery ?? "")
        }
    }
    
    static let single = Joke(
        id: 1,
        category: .Misc,
        type: .single,
        lang: .en,
        setup: nil,
        delivery: nil,
        joke: "Never date a baker. They are too kneady."
    )
    
    static let twopart = Joke(
        id: 2,
        category: .Pun,
        type: .twopart,
        lang: .en,
        setup: "Which is faster? Hot or cold?",
        delivery: "Hot, cecause you can catch a cold.",
        joke: nil
    )
}
