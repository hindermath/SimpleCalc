//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Thorsten Hindermann on 21.06.24.
//

import XCTest
@testable import SimpleCalc // Import your app module


final class SimpleCalcUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch() // Launch your app
        }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    func testSliderAccessibility() {
            // Navigate to the Settings view (assuming it's part of your app flow)
            // Modify this based on your actual navigation logic
            //app.buttons["Settings"].tap()
        app.staticTexts["0"].swipeLeft()
        

            // Verify accessibility labels
            XCTAssertTrue(app.staticTexts["Seconds to wait"].exists)
            XCTAssertTrue(app.sliders["Horizontal Slider"].exists)

            // Interact with the slider
            let slider = app.sliders["Horizontal Slider"]
            slider.adjust(toNormalizedSliderPosition: 0.8) // Adjust to your desired value

            // Verify that the value is updated
            XCTAssertEqual(slider.value as? Double, 4.0) // Adjust expected value

            // You can add more assertions as needed
        }
    
    func testButtonActions() {
            // Navigate to the ContentView (assuming it's part of your app flow)
            // Modify this based on your actual navigation logic
            //app.buttons["Settings"].tap()

            // Verify accessibility labels
            //XCTAssertTrue(app.staticTexts["0"].exists)
            XCTAssertTrue(app.buttons["7"].exists)
            XCTAssertTrue(app.buttons["8"].exists)
            XCTAssertTrue(app.buttons["9"].exists)
            XCTAssertTrue(app.buttons["Plus"].exists)

            // Interact with buttons
            app.buttons["7"].tap()
            app.buttons["8"].tap()
            app.buttons["Plus"].tap()

            // Verify that the result is updated (adjust expected value)
            //XCTAssertEqual(app.staticTexts["7 + 8"].label, "15")

            // You can add more assertions as needed
        }
}
