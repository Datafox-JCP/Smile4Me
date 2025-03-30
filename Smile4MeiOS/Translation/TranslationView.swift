//
//  TranslationView.swift
//  Smile4MeiOS
//
//  Created by Juan Carlos Pazos on 24/03/25.
//

import SwiftUI
import Translation

struct TranslationView: View {
    @State private var translationService = TranslationService()
    @State private var targetLanguaje = Locale.Language(
        languageCode: "en",
        script: nil,
        region: "US"
    )
    @State private var configuation: TranslationSession.Configuration?
    
    let joke: Joke
    
    var body: some View {
        Text(translationService.translatedText)
            .italic()
            .textSelection(.enabled)
            .translationTask(configuation) { session in
                do {
                    try await translationService.translate(
                        text: joke.fullJoke,
                        session: session
                    )
                } catch{
                    translationService.translatedText = ""
                }
            }
        
        Picker("Target Language", selection: $targetLanguaje) {
            ForEach(translationService.availableLanguages) { language in
                Text(language.localizedName()).tag(language.locale)
            }
        }
        .onChange(of: targetLanguaje) { oldValue, newValue in
            if newValue != oldValue {
                configuation?.invalidate()
                configuation = TranslationSession.Configuration(target: targetLanguaje)
            }
        }
        .onChange(of: joke) {
            translationService.translatedText = ""
        }
        
        if let langCode = targetLanguaje.languageCode, "\(langCode)" != joke.lang.rawValue, translationService.translatedText.isEmpty {
            HStack {
                Button("Translate", systemImage: "translate") {
                    triggerTranslation()
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .disabled(joke.fullJoke.isEmpty)
                
                Spacer()
            }
        }
    }
    
    func triggerTranslation() {
        if configuation == nil {
            configuation = TranslationSession.Configuration(target: targetLanguaje)
        } else {
            configuation?.invalidate()
        }
    }
}

#Preview {
    TranslationView(joke: Joke.single)
}
