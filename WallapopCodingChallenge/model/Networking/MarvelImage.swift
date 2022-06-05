//
//  MarvelImage.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation

enum ImageSize: String {
    case portraitMedium = "portrait_medium"
    case portraitLarge = "portrait_xlarge"
    case detail = "detail"
    case landscapeLarge = "landscape_large"
    case landscapeMedium = "landscape_medium"
}

struct MarvelImage: Decodable {
    var path: String
    var `extension`: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case `extension`
    }
    
    init() {
        path = ""
        `extension` = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        path = try container.decodeIfPresent(String.self, forKey: .path) ?? ""
        `extension` = try container.decodeIfPresent(String.self, forKey: .extension) ?? ""
    }
}
