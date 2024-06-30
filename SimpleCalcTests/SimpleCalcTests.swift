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
        contentView = ContentView(result: "42", number1: 2, number2: 1, mathOperation: .plus, errorState: true)
    }
    override func tearDown() {
        contentView = nil
        super.tearDown()
    }

    func testClear() {
        // Act
        contentView.Clear()
        // Assert
        XCTAssertEqual(contentView.result, "0")
        XCTAssertEqual(contentView.number1, 0)
        XCTAssertEqual(contentView.number2, 0)
        XCTAssertEqual(contentView.mathOperation, .unknown)
        XCTAssertFalse(contentView.errorState)
    }
    
    func testMathOpPressed() {
        // Arrange
        contentView.result = "42"
        contentView.number1 = 0
        contentView.mathOperation = .unknown
        // Act
        contentView.mathOpPressed(mathop: .plus)
        // Assert
        XCTAssertEqual(contentView.number1, 42.0)
        XCTAssertEqual(contentView.result, "0")
        XCTAssertEqual(contentView.mathOperation, .plus)
        
    }
    func testNegatePressed() {
        // Arrange
        contentView.result = "42"
        // Act
        contentView.negatePressed()
        // Assert
        XCTAssertEqual(contentView.result, "-42")

    }
}
