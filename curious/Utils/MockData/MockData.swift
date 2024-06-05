//
//  MockData.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation


struct MockData{
    
    static let users: [UserModel] = [
        .init(
            id: NSUUID().uuidString,
            fullname:"Syam Shukla",
            profileImageURL: []
        ),
        .init(
            id: NSUUID().uuidString,
            fullname:"User2",
            profileImageURL: []
        ),
        .init(
            id: NSUUID().uuidString,
            fullname:"User3",
            profileImageURL: []
        )
    ]
    
}
