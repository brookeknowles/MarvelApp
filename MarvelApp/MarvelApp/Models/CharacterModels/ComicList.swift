//
//  ComicList.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//
import Foundation

struct ComicList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [ComicSummary]?
}
