//
//  ThumbnailTest.swift
//  WallapopCodingChallengeTests
//
//  Created by Nikos Aggelidis on 31/5/22.
//

import XCTest
@testable import WallapopCodingChallenge

class ThumbnailTest: XCTestCase {
    var thumbnail: Thumbnail!
    let path = "http://fakeimage.com/etc"
    let ext = "png"
    
    override func setUp() {
        self.thumbnail = Thumbnail(path: self.path, extension: self.ext)
    }
    
    func testShouldReturnUrlPath() {
        let type: ThumbnailType = .detail
        let urlPath = self.thumbnail.urlPath(thumbnailType: type)
        let expectedPath = "\(self.path)/\(type.rawValue).\(self.ext)"
        XCTAssertEqual(urlPath, expectedPath)
    }
}
