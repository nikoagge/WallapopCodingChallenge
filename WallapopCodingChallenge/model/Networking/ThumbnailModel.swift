//
//  Thumbnail.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct ThumbnailModel: Decodable {
    let path: String
    let `extension`: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case `extension`
    }
    
    init(path: String, `extension`: String) {
        self.path = path
        self.`extension` = `extension`
    }
    
    init(from decoder: Decoder) throws {
        let allValues = try decoder.container(keyedBy: CodingKeys.self)
        path = try allValues.decode(String.self, forKey: .path)
        `extension` = try allValues.decode(String.self, forKey: .extension)
    }
    
    var fullName: String {
        get { return path + "." + `extension` }
    }
}

extension ThumbnailModel: Equatable {
    static func == (lhs: ThumbnailModel, rhs: ThumbnailModel) -> Bool {
        return lhs.path == rhs.path &&
            lhs.`extension` == rhs.`extension`
    }
}
