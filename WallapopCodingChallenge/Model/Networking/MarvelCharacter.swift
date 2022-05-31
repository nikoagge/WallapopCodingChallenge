//
//  MarvelCharacter.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct MarvelCharacter: Codable {
    var id: Int!
    var name: String!
    var description: String!
    var modified: String!
    var thumbnail: Thumbnail!
    var resourceURI: String!
    var comics: Comics!
    var series: Series!
    var stories: Stories!
    var events: Events!
    var marvelURLs: [MarvelUrl]! = []
    
    func getLink(to marvelURLType: MarvelURLType) -> MarvelUrl? {
        return marvelURLs.filter { (marvelURL) -> Bool in
            return marvelURL.marvelURLType == marvelURLType
        }.first ?? nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, modified, thumbnail, resourceURI, comics, series, stories, events
        case marvelURLs = "urls"
    }
}
