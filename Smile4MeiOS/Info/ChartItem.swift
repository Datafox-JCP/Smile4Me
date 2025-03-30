//
//  ChartItem.swift
//  Smile4MeiOS
//
//  Created by Juan Carlos Pazos on 30/03/25.
//

import Foundation

struct ChartItem: Identifiable {
    enum JokeType: String {
        case safe, unsafe
    }
    
    var id = UUID()
    var lang: String
    var qty: Int
    let jokeType: JokeType
}
