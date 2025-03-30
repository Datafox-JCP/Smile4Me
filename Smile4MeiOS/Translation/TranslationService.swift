//
//  TranslationService.swift
//  Smile4MeiOS
//
//  Created by Juan Carlos Pazos on 24/03/25.
//

import Foundation
import Translation

@Observable
class TranslationService {
    var translatedText = ""
    var availableLanguages: [AvailableLanguage] = []
    
    init() {
        getSupportedLanguages()
    }
    
    func getSupportedLanguages() {
        Task { @MainActor in
            let supportedLanguages = await LanguageAvailability().supportedLanguages
            availableLanguages = supportedLanguages.map({ local in
                AvailableLanguage(locale: local)
            }).sorted()
        }
    }
    
    func translate(text: String, session: TranslationSession) async throws {
        let rsponse = try await session.translate(text)
        translatedText = rsponse.targetText
    }
}
