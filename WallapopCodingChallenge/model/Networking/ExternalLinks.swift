//
//  ExternalLinks.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation

struct ExternalLinks: Decodable {
    var linkType: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
    
    init() {
        linkType = ""
        url = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        linkType = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
