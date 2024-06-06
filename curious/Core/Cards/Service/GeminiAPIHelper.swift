//
//  GeminiAPIHelper.swift
//  curious
//
//  Created by Syam Shukla on 6/6/24.
//

import Foundation
import GoogleGenerativeAI

class GeminiAPIHelper {
    private let model = GenerativeModel(name: "gemini-pro", apiKey: "AIzaSyA3S-gPVgsMGYRFpcvvGGO9NB5pueNwvT8") // Your API Key

    func fetchFacts(completion: @escaping ([FactModel]?, Error?) -> Void) {
        let prompt = "Give me 10 interesting and surprising facts that a curious person would enjoy. Facts should be up-to-date and cover a wide range of topics, from science and technology to history and culture."

        Task {
            do {
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    // Extract facts from the response text
                    let facts = parseFactsFromResponse(text)
                    print(facts)
                    completion(facts, nil)
                } else {
                    completion(nil, NSError(domain: "No facts found", code: -1, userInfo: nil))
                    
                }
            } catch {
                completion(nil, error)
            }
        }
    }

    // Function to parse facts from the model's response text
    private func parseFactsFromResponse(_ text: String) -> [FactModel] {
        // You'll need to implement this logic based on how the Gemini model structures its responses.
        // This is an example, you might need to adjust based on the actual format.
        let lines = text.split(separator: "\n")
        return lines.compactMap { line -> FactModel? in
            if line.isEmpty { return nil }
            return FactModel(text: String(line)) // Create FactModel for each line
        }
    }
}
