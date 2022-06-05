//
//  Data+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import CryptoKit

extension Data {
    var md5: String {
        Insecure.MD5
            .hash(data: self)
            .map { String(format: "%02x", $0) }
            .joined()
    }
}
