//
//  CharacterDataWrapper.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 28/06/22.
//

import Foundation

struct CharacterDataWrapper: Codable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var data: CharacterDataContainer?
    var etag: String?
}
