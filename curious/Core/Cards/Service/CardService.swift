//
//  CardService.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

struct CardService{
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({CardModel(user:$0)})
    }
}
