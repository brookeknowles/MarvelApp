//
//  SeriesList.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//

import Foundation

struct SeriesList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [SeriesSummary]?
}
