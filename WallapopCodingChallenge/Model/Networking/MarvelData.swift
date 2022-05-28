//
//  MarvelData.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let marvelCharacters: [MarvelCharacter]
    
    func hasMore() -> Bool {
        return (offset + count) < total
    }
    
    private enum CodingKeys: String, CodingKey {
        case offset, limit, total, count
        case marvelCharacters = "results"
    }
}
