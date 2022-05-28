//
//  MarvelCharacterResult.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct MarvelCharacterResult: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let eTag: String
    let marvelData: MarvelData
    
    private enum CodingKeys: String, CodingKey {
        case code, status, copyright, attributionText, attributionHTML
        case eTag = "etag"
        case marvelData = "data"
    }
}
