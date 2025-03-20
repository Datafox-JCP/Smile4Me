//
//  Language.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import Foundation

enum Language: String, Codable, CaseIterable, Identifiable, Sendable {
    case en, fr, cs, de, es, pt
    public var id: Self { self }
}
