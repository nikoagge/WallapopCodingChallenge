//
//  String+ExtensionTest.swift
//  WallapopCodingChallengeTests
//
//  Created by Nikos Aggelidis on 31/5/22.
//

import XCTest
@testable import WallapopCodingChallenge

class String_ExtensionTest: XCTestCase {
    func testShouldGenerateMD5() {
        let samplePhrase = "Game of Thrones deserve a better ending"
        let expectedMD5 = "72f223831ae66b6277b9010c85d5fe70"
        XCTAssertEqual(samplePhrase.md5(), expectedMD5)
    }
}
