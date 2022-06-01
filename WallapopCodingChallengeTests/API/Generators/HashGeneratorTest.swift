//
//  HashGeneratorTest.swift
//  WallapopCodingChallengeTests
//
//  Created by Nikos Aggelidis on 31/5/22.
//

import XCTest
@testable import WallapopCodingChallenge

class HashGeneratorTest: XCTestCase {
    let publicKey = "2357235hsog2323"
    let privateKey = "23523nfsudgafas"
    let ts = "1573178292224.2952"
    
    func testShouldGenerateHash() {
        let hash = HashGenerator.hash(timestamp: ts, privateKey: privateKey, publicKey: publicKey)
        XCTAssertEqual(hash, "7c9baf7077f704a30ecee0b52623de0d")
    }
}
