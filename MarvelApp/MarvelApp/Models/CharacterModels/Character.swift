//
//  Character.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//

import Foundation

struct Character: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var resourceURI: String?
    var urls: [Url]?
    var thumbnail: Image?
    var comics: ComicList?
    var stories: StoryList?
    var events: EventList?
    var series: SeriesList?
}
