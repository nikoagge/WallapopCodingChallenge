//
//  Thumbnail.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
    
    func urlPath(thumbnailType: ThumbnailType)-> String {
        return "\(path)/\(thumbnailType.rawValue).\(`extension`)"
    }
}
