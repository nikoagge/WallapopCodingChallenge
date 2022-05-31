//
//  UIView+ExtensionTest.swift
//  WallapopCodingChallengeTests
//
//  Created by Nikos Aggelidis on 31/5/22.
//

import XCTest
@testable import WallapopCodingChallenge

class UIView_ExtensionTest: XCTestCase {
    var view: UIView!
    let activityIndicator = UIActivityIndicatorView(style: .medium)

    override func setUp() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
    
    func testShouldShowActivityIndicatorToView() {
        self.view.showActivityIndicator(self.activityIndicator)
        XCTAssertTrue(self.activityIndicator.isDescendant(of: self.view))
        XCTAssertTrue(self.activityIndicator.isAnimating)
    }
    
    func testShouldHideActivityIndicatorFromView() {
        self.view.showActivityIndicator(self.activityIndicator)
        self.view.hideActivityIndicator(self.activityIndicator)
        XCTAssertTrue(!self.activityIndicator.isDescendant(of: self.view))
        XCTAssertTrue(!self.activityIndicator.isAnimating)
    }
    
    override func tearDown() {
        self.view = nil
    }
}
