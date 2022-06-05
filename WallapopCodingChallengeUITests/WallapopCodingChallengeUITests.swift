//
//  WallapopCodingChallengeUITests.swift
//  WallapopCodingChallengeUITests
//
//  Created by Nikos Aggelidis on 25/5/22.
//

import XCTest

class WallapopCodingChallengeUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func test_SearchForCountry() {
        app.launch()
        let textField = app.textFields["searchTextField"]
        textField.tap()
        textField.clearText(andReplaceWith: "Spider-man")
        XCTAssertEqual(textField.value as! String, "Spider-man", "Text field value is not correct")
    }
    
    func test_collectionScroolBehavior() {
        app.launch()
        let marvelCollection = app.collectionViews.firstMatch
        let measureOptions = XCTMeasureOptions()
        measureOptions.invocationOptions = [.manuallyStop]
        
        if #available(iOS 14.0, *) {
            measure(metrics: [XCTOSSignpostMetric.scrollDecelerationMetric], options: measureOptions) {
                marvelCollection.swipeUp(velocity: .fast)
                stopMeasuring()
                marvelCollection.swipeDown(velocity: .fast)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
}

extension XCUIElement {
    func clearText(andReplaceWith newText:String? = nil) {
        tap()
        press(forDuration: 1.0)
        var select = XCUIApplication().menuItems["Select All"]

        if !select.exists {
            select = XCUIApplication().menuItems["Select"]
        }
        if select.waitForExistence(timeout: 0.5), select.exists {
            select.tap()
            typeText(String(XCUIKeyboardKey.delete.rawValue))
        } else {
            tap()
        }
        if let newVal = newText {
            typeText(newVal)
        }
    }
}
