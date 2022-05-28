//
//  Series.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct Series: Codable {
    let available: Int
    let collectionURI: String
    let resources: [Resource]
    
    private enum CodingKeys: String, CodingKey {
        case available, collectionURI
        case resources = "items"
    }
}
