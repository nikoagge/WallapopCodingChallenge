//
//  HashGenerator.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation

struct HashGenerator {
    static func hash(timestamp: String, privateKey: String, publicKey: String) -> String {
        return "\(timestamp)\(privateKey)\(publicKey)".md5()
    }
}
