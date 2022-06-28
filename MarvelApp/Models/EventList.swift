//
//  EventList.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//
import Foundation

struct EventList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [EventSummary]?
}
