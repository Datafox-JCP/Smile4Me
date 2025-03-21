//
//  JokeContentView.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import SwiftUI

struct JokeContentView: View {
    // MARK: Properties
    let jokeManager = JokeManager()
    
    @State private var joke: Joke?
    @State private var category: Category = .Any
    @State private var language: Language = .en
    @State private var errorString = ""
    @State private var fetching = false
    
    @Environment(\.openURL) var openURL
    
    // MARK: - vuew
    var body: some View {
        NavigationStack {
            ZStack {
                if fetching {
                    ProgressView()
                } // It's fecthing the joke
                ScrollView {
                    VStack {
                        HStack {
                            Picker("Language", selection: $language) {
                                ForEach(Language.allCases) { language in
                                    Text(language.full)
                                } // Loop
                            } // Language picker
                            
                            Picker("Category", selection: $category) {
                                ForEach(Category.allCases) { category in
                                    Text("\(category)")
                                } // Loop
                            } // Category picker
                        } // HStack
                        
                        Button {
                            Task {
                                await getJoke()
                            }
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        } // getJoke button
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        JokeView(joke: joke, errorString: errorString)
                        
                        HStack {
                            Spacer()
                            
                            if let joke {
                                ShareLink(item: joke.fullJoke)
                            } // Joke found
                        } // HStack
                        
                        HStack(alignment: .top) {
                            if let joke {
                                Button("Report Joke") {
                                    let jokeToReport = "Joke ID: \(joke.id)\nJoke: \(joke.fullJoke)"
                                    let pasteboard = NSPasteboard.general
                                    pasteboard.declareTypes([.string], owner: nil)
                                    pasteboard.setString(jokeToReport, forType: .string)
                                    
                                    guard let url = URL(string: jokeManager.issueURL) else { return }
                                    openURL(url)
                                    
                                } // Report button
                                
                                Text("Yo can report an unsafe joke. The Joke id and content will be on your clipboard.")
                                    .font(.caption)
                                    .lineLimit(nil)
                                    .foregroundStyle(.red)
                            } // Joke found
                        } // HStack
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } // VSTack
                    .padding()
                } // Scroll
            } // ZStacl
            .navigationTitle("Smile4Me")
        } // Nav
        // MARK: Tasks
        .task {
            await getJoke()
        }
        .task(id: category) {
            await getJoke()
        }
        .task(id: language) {
            await getJoke()
        }
    }
    
    // MARK: - Functions
    func getJoke() async {
        errorString = ""
        fetching = true
        defer {
            fetching = false
        }
        do {
            joke = try await jokeManager.getJoke(category: category, language: language)
        } catch {
            errorString = "No joke for \(category), \(language) "
        }
    }
}

// MARK: Preview
#Preview {
    JokeContentView()
}
