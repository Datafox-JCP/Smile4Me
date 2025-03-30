//
//  APIService.swift
//  SmileForMe
//
//  Created by Juan Carlos Pazos on 20/03/25.
//

import Foundation

class APIService {
    let urlString: String
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func getJSON<T: Decodable>() async throws(APIError) -> T {
        guard let url = URL(string: urlString) else {
            throw .invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponseStatus
            }
            let decoder = JSONDecoder()
            do {
                let decoderData = try decoder.decode(T.self, from: data)
                return decoderData
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch {
            throw .dataTaskError(error.localizedDescription)
        }
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case dataTaskError(String)
    case invalidResponseStatus
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            NSLocalizedString("La URL del endpoint no es válida", comment: "")
        case .dataTaskError(let string):
            string
        case .invalidResponseStatus:
            NSLocalizedString("El API no devolvió una respuesta correcta", comment: "")
        case .decodingError(let string):
            string
        }
    }
}
