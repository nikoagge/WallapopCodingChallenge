//
//  Comics.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct ComicModel: Decodable {
    let id: Int
    let title: String
    let thumbnail: ThumbnailModel
    
    init(id: Int, title: String, thumbnail: ThumbnailModel) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}

extension ComicModel: Equatable {
    static func == (lhs: ComicModel, rhs: ComicModel) -> Bool {
        return lhs.id == rhs.id &&
               lhs.title == rhs.title &&
               lhs.thumbnail == rhs.thumbnail
    }
}

struct ComicData: Decodable {
    let results: [ComicModel]
}

struct ComicResponse: Decodable {
    let data: ComicData
}
