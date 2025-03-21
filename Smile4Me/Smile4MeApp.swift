//
//  Smile4MeApp.swift
//  Smile4Me
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import SwiftUI
import LaunchAtLogin

@main
struct Smile4MeApp: App {
    var body: some Scene {
        MenuBarExtra("Smile4Me", image: "MenuBarIcon") {
            VStack(alignment: .leading) {
                JokeContentView()
                
                Divider()
                
                HStack {
                    Text("Made with ❤️ by Juan Carlos Pazos")
                    
                    Spacer()
                    
                    LaunchAtLogin.Toggle()
                    
                    Spacer()
                    
                    Button("Quit") {
                        NSApplication.shared.terminate(nil)
                    }
                    .keyboardShortcut("q")
                } // HStack
                .padding(8)
            } // VStack
            .frame(width: 400, height: 400)
        }
        .menuBarExtraStyle(.window)
    }
}
