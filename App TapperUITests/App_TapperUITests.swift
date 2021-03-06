//
//  App_TapperUITests.swift
//  App TapperUITests
//
//  Created by Felix Barros on 11/27/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest

class App_TapperUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItemsDisplayOnLoad() {
        let app = XCUIApplication()
        let gameTitle = app.images["tapper"]
        let tapsToWin = app.textFields["How many taps to win?"]
        let playButton = app.buttons["play button"]
        
        let tapButton = app.buttons["coin"]
        let tapOutput = app.staticTexts["0 Taps"]
        
        // Items displayed
        XCTAssert(gameTitle.hittable)
        XCTAssert(tapsToWin.hittable)
        XCTAssert(playButton.hittable)
        
        // Items initially hidden
        XCTAssertFalse(tapButton.hittable)
        XCTAssertFalse(tapOutput.hittable)
    }
    
    func testPlayButton() {
        let app = XCUIApplication()
        let playButton = app.buttons["play button"]
        let tapsToWin = app.textFields["How many taps to win?"]

        tapsToWin.tap()
        tapsToWin.typeText("5")
        playButton.tap()
        
        let gameTitle = app.images["tapper"]
        
        let tapButton = app.buttons["coin"]
        let tapOutput = app.staticTexts["0 Taps"]
        
        // Items hidden
        XCTAssertFalse(gameTitle.hittable)
        XCTAssertFalse(tapsToWin.hittable)
        XCTAssertFalse(playButton.hittable)
        
        // Items now displayed
        XCTAssert(tapButton.hittable)
        XCTAssert(tapOutput.hittable)
    }
    
    func testPlayWithNoGoal() {
        let app = XCUIApplication()
        
        let playButton = app.buttons["play button"]
        let tapsToWin = app.textFields["How many taps to win?"]
        let gameTitle = app.images["tapper"]
        let tapButton = app.buttons["coin"]
        let tapOutput = app.staticTexts["0 Taps"]
        
        playButton.tap()
        
        // Items displayed
        XCTAssert(gameTitle.hittable)
        XCTAssert(tapsToWin.hittable)
        XCTAssert(playButton.hittable)
        
        // Items initially hidden
        XCTAssertFalse(tapButton.hittable)
        XCTAssertFalse(tapOutput.hittable)
    }
    
    func testPlayAndTap() {
        let app = XCUIApplication()
        let playButton = app.buttons["play button"]
        let tapsToWin = app.textFields["How many taps to win?"]
        
        tapsToWin.tap()
        tapsToWin.typeText("5")
        playButton.tap()
        
        let tapButton = app.buttons["coin"]
        let tapOutput = app.staticTexts.elementBoundByIndex(0)
        
        tapButton.tap()
        XCTAssertEqual(tapOutput.label, "1 Tap")
        
        tapButton.tap()
        XCTAssertEqual(tapOutput.label, "2 Taps")
    }
    
    func testPlayAndTapUntilGoal() {
        let app = XCUIApplication()
        let playButton = app.buttons["play button"]
        let tapsToWin = app.textFields["How many taps to win?"]
        
        tapsToWin.tap()
        tapsToWin.typeText("5")
        playButton.tap()
        
        let tapButton = app.buttons["coin"]
        let tapOutput = app.staticTexts.elementBoundByIndex(0)
        
        tapButton.tap()
        tapButton.tap()
        tapButton.tap()
        tapButton.tap()
        XCTAssertEqual(tapOutput.label, "4 Taps")
        tapButton.tap()
        
        let gameTitle = app.images["tapper"]
        
        // Items displayed
        XCTAssert(gameTitle.hittable)
        XCTAssert(tapsToWin.hittable)
        XCTAssert(playButton.hittable)
        
        // Items initially hidden
        XCTAssertFalse(tapButton.hittable)
        XCTAssertFalse(tapOutput.hittable)
    }
    
}
