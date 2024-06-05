//
//  CardModel.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

struct CardModel{
    let user: UserModel
}
extension CardModel: Identifiable, Hashable{
    var id: String {return user.id}
}
