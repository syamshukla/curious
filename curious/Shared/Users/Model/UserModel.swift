//
//  User.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    let id: String
    var email: String?
    var fullname: String?
    var profileImageURL: String?
}
