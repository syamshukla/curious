//
//  CardModel.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

//struct CardModel{
//    let user: UserModel
//}
//extension CardModel: Identifiable, Hashable{
//    var id: String {return user.id}
//}
struct CardModel: Identifiable, Equatable { // Add Equatable conformance
    let id = UUID()
    var facts: [FactModel] = []

    // Implement the required Equatable method
    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        return lhs.id == rhs.id // Compare by ID
    }
}


