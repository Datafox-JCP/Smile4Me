//
//  JokeContentView.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import SwiftUI

struct JokeContentView: View {
    let jokeManager = JokeManager()
    @State private var joke: Joke?
    
    var body: some View {
        VStack {
            if let joke {
                Text(joke.setup ?? "")
                Text(joke.delivery ?? "")
                Text(joke.joke ?? "")
            } else {
                Text("No joke exists")
            }
        }
        .padding()
        .task {
            do {
                joke = try await jokeManager.getJoke()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    JokeContentView()
}
