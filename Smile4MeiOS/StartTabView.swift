//
//  StartTabView.swift
//  Smile4MeiOS
//
//  Created by Juan Carlos Pazos on 23/03/25.
//

import SwiftUI

struct StartTabView: View {
    var body: some View {
        TabView {
            Tab("Joke", systemImage: "face.smiling") {
                JokeContentView()
            }
            
            Tab("Info", systemImage: "info.circle") {
                InfoView()
            }
        }
    }
}

#Preview {
    StartTabView()
}
