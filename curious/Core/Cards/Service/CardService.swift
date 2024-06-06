//
//  CardService.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

struct CardService {
    let apiHelper = GeminiAPIHelper()

    func fetchCardModels() async throws -> [CardModel] {
        // Fetch facts from Gemini API
        let facts = try await withCheckedThrowingContinuation { continuation in
            apiHelper.fetchFacts { facts, error in
                if let facts = facts {
                    continuation.resume(returning: facts)
                } else if let error = error {
                    continuation.resume(throwing: error)
                }
            }
        }

        // Create CardModels with the fetched facts
        let cardModels = facts.map { fact in
            CardModel(facts: [fact])
        }

        return cardModels
    }
}
