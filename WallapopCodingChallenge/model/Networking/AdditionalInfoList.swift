//
//  AdditionalInfoList.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation

enum CollectionInfoType {
     case comics
     case events
     case series
}

class AdditionalInfoList: Decodable {
    var results: [AdditionalInfo]
    
    enum CodingKeys: String, CodingKey  {
        case data
        case results
    }
    
    init() {
        results = []
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        results = try data.decodeIfPresent([AdditionalInfo].self, forKey: .results) ?? []
    }
}
