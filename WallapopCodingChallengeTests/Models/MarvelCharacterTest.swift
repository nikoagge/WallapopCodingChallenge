//
//  MarvelCharacterTest.swift
//  WallapopCodingChallengeTests
//
//  Created by Nikos Aggelidis on 31/5/22.
//

import XCTest
@testable import WallapopCodingChallenge

class MarvelCharacterTest: XCTestCase {
    var marvelCharacter: MarvelCharacter!
    
    override func setUp() {
        self.marvelCharacter = MarvelCharacter()
    }
    
    func testShouldReturnNilWhenNoUrlInformed() {
        let url = self.marvelCharacter.getLink(to: .comicLink)
        XCTAssertNil(url)
    }
    
    func testShouldReturnUrlByType() {
        let marvelUrl = MarvelUrl(marvelURLType: .comicLink, url: "http://fakeimage.com/etc.png")
        self.marvelCharacter.marvelURLs.append(marvelUrl)
        let existingUrl = self.marvelCharacter.getLink(to: .comicLink)
        let notExistingUrl = self.marvelCharacter.getLink(to: .detail)
        
        XCTAssertEqual(marvelUrl.url, existingUrl?.url)
        XCTAssertNil(notExistingUrl)
    }
    
    override func tearDown() {
        marvelCharacter = nil
    }
}
