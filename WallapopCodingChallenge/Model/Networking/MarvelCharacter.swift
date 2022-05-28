//
//  MarvelCharacter.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct MarvelCharacter: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
    let series: Series
    let stories: Stories
    let events: Events
    let marvelURLs: [MarvelUrl] = []
    
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
