//
//  Events.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct Events: Codable {
    let available: Int
    let collectionURI: String
    let resources: [Resource]
    let returned: Int
    
    private enum CodingKeys: String, CodingKey {
        case available, collectionURI, returned
        case resources = "items"
    }
}
