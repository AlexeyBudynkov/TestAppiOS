//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Алан Максвелл on 27.01.2021.
//  Copyright © 2021 Алан Максвелл. All rights reserved.
//

import XCTest
@testable import TestApp

class TestAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        NSLog("BOUNDS=\(UIScreen.main.bounds.size)")
        NSLog("size=\(UIScreen.main.currentMode!.size)")
        NSLog("scale=\(UIScreen.main.scale)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
