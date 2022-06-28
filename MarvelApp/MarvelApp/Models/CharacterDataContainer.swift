//
//  CharacterDataContainer.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 28/06/22.
//

import Foundation

struct CharacterDataContainer: Codable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Character]?
}
