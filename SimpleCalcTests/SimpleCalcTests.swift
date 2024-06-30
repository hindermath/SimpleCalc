//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Thorsten Hindermann on 21.06.24.
//

import XCTest

final class SimpleCalcTests: XCTestCase {
    var contentView: ContentView!
    
    override func setUp() {
        super.setUp()
        contentView = ContentView()
    }
    override func tearDown() {
        contentView = nil
    }

    func testClear() {
        // Arrange
        contentView.result = "42"
        contentView.number1 = 1
        contentView.number2 = 2
        contentView.mathOperation = .plus
        contentView.errorState = true
        // Act
        contentView.Clear()
        // Assert
        XCTAssertEqual(contentView.result, "0")
        XCTAssertEqual(contentView.number1, 0)
        XCTAssertEqual(contentView.number2, 0)
        XCTAssertEqual(contentView.mathOperation, .unknown)
        XCTAssertFalse(contentView.errorState)
    }
}
