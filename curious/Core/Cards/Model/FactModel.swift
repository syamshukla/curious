//
//  FactModel.swift
//  curious
//
//  Created by Syam Shukla on 6/6/24.
//

import Foundation

struct FactModel: Identifiable, Codable {
    var id = UUID()
    let text: String
}
